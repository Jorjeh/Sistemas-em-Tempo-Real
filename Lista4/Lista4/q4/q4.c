#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h> 
#include <math.h>   
#include <time.h>

// tipos de estado do computador
typedef enum {
    STATE_VIAGEM,   
    STATE_VELOCIDADE, 
    STATE_TOTAL,    
    STATE_TEMPO     
} BikeState;

// constantes do hardware e cálculos
#define WHEEL_RADIUS_M 0.33 // aqui foi definido o raio da roda em metros
#define WHEEL_CIRCUMFERENCE (2.0 * M_PI * WHEEL_RADIUS_M) // aqui foi definida a circunferência da roda em m
// velocidade constante em km/h
#define SIMULATED_SPEED_KPH 18.0 

// controle para encerrar as threads
volatile int g_running = 1; 

// variáveis globais
BikeState g_current_state = STATE_VIAGEM;

double g_trip_distance_m = 0.0;    
double g_total_distance_m = 0.0;   
long g_trip_time_s = 0;            
long g_last_wheel_time_ms = 0;     

// sincronização
pthread_mutex_t g_data_mutex;

// função auxiliar para obter tempo em milissegundos
long get_current_time_ms() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
}

// hreads e handlers dos eventos

/**
 * @brief Thread D: exibição do display.
 */
void* display_thread(void* arg) {
    long current_time_ms;
    double current_speed_kph = 0.0;
    
    printf("Display Thread iniciada.\n");

    while (g_running) {
        BikeState state;
        double dist_trip, dist_total;
        long time_trip, last_time;
        int sleep_time_us = 0;

        // leitura das variáveis de estado
        pthread_mutex_lock(&g_data_mutex);
        state = g_current_state;
        dist_trip = g_trip_distance_m;
        dist_total = g_total_distance_m;
        time_trip = g_trip_time_s;
        last_time = g_last_wheel_time_ms;
        current_time_ms = get_current_time_ms();
        pthread_mutex_unlock(&g_data_mutex);

        printf("\n--------------------------------\n");
        
        switch (state) {
            case STATE_VIAGEM:
                printf("Estado: Viagem\n");
                printf("Quilometragem atual da viagem: %.2f km\n", dist_trip / 1000.0);
                sleep_time_us = 200000; // 200 ms
                break;

            case STATE_VELOCIDADE:
                printf("Estado: Velocidade\n");

                // cálculando a velocidade, a base é o tempo do último giro da roda
                if (last_time > 0) {
                    long time_diff_ms = current_time_ms - last_time;
                    if (time_diff_ms > 0) {
                        current_speed_kph = (WHEEL_CIRCUMFERENCE / (time_diff_ms / 1000.0)) * 3.6;
                    } 
                } else {
                    current_speed_kph = 0.0;
                }
                
                // aqui fica aguardando alguma resposta da roda, caso não haja a velocidade vai pra zero
                if (current_time_ms - last_time > 3000 && last_time > 0) {
                     current_speed_kph = 0.0;
                } else if (last_time == 0) {
                     current_speed_kph = 0.0;
                }
                
                printf("Velocidade Atual: %.1f km/h\n", current_speed_kph);
                sleep_time_us = 100000; // 100 ms
                break;

            case STATE_TOTAL:
                printf("Estado: Total\n");
                printf("Quilometragem Total: %.1f km\n", dist_total / 1000.0);
                sleep_time_us = 500000; // 500 ms
                break;
                
            case STATE_TEMPO:
                printf("Estado: Tempo\n");
                printf("Tempo da Viagem: %ld segundos\n", time_trip);
                sleep_time_us = 1000000; // 1 segundo
                break;
        }
        usleep(sleep_time_us);
    }
    return NULL;
}

/**
 * @brief Thread C: simulação do relógio.
 */
void* clock_thread(void* arg) {
    printf("Clock Thread iniciada.\n");
    while (g_running) {
        sleep(1); 
        
        pthread_mutex_lock(&g_data_mutex);
        g_trip_time_s++;
        pthread_mutex_unlock(&g_data_mutex);
    }
    return NULL;
}

/**
 * @brief atualiuza a distância do temppo de cada giro da roda
 * 
 */
void handle_wheel_int() {
    pthread_mutex_lock(&g_data_mutex);
    
    // atualização da distância
    g_trip_distance_m += WHEEL_CIRCUMFERENCE;
    g_total_distance_m += WHEEL_CIRCUMFERENCE;
    
    // atualização do timestamp do último giro
    g_last_wheel_time_ms = get_current_time_ms();
    
    pthread_mutex_unlock(&g_data_mutex);
}

/**
 * @brief NOVO: thread do giro da roda na velocidade constante.
 */
void* wheel_simulator_thread(void* arg) {
    // converte a velocidade em km/h para m/s
    double speed_mps = SIMULATED_SPEED_KPH / 3.6; 
    
    // obtem o tempo (em segundos) para percorrer uma circunferência
    double time_per_rotation_s;
    if (speed_mps > 0) {
        time_per_rotation_s = WHEEL_CIRCUMFERENCE / speed_mps;
    } else {
        time_per_rotation_s = 0.1; // valor usado para evitar a divisão por zero (evita bug)
    }
    
    long sleep_time_us = (long)(time_per_rotation_s * 1000000.0);

    printf("Wheel Simulator Thread iniciada. Velocidade: %.1f km/h. Intervalo de Giro: %.2f ms\n", 
           SIMULATED_SPEED_KPH, time_per_rotation_s * 1000.0);

    while (g_running) {
        handle_wheel_int();
        usleep(sleep_time_us);
    }
    return NULL;
}


// os botões do painel 
void handle_mode_int() {
    pthread_mutex_lock(&g_data_mutex);
    switch (g_current_state) {
        case STATE_VIAGEM:
            g_current_state = STATE_VELOCIDADE; break;
        case STATE_VELOCIDADE:
            g_current_state = STATE_TOTAL; break;
        case STATE_TOTAL:
            g_current_state = STATE_TEMPO; break;
        case STATE_TEMPO:
            g_current_state = STATE_VIAGEM; break;
    }
    printf("\n[MODE_INT] Estado alterado para: %d\n", g_current_state);
    pthread_mutex_unlock(&g_data_mutex);
}

// reset
void handle_reset_int() {
    pthread_mutex_lock(&g_data_mutex);
    if (g_current_state == STATE_VIAGEM) {
        g_trip_distance_m = 0.0;
        printf("\n[RESET_INT] Resetando o tempo da Viagem.\n");
    } else if (g_current_state == STATE_TEMPO) {
        g_trip_time_s = 0;
        printf("\n[RESET_INT] Resetando o tempo da viagem.\n");
    } else {
        printf("\n[RESET_INT] Ação ignorada no estado %d.\n", g_current_state);
    }
    pthread_mutex_unlock(&g_data_mutex);
}


int main() {
    pthread_t display_tid, clock_tid, wheel_sim_tid;

    if (pthread_mutex_init(&g_data_mutex, NULL) != 0) {
        perror("Mutex init failed");
        return 1;
    }

    // cria as Threads
    if (pthread_create(&display_tid, NULL, display_thread, NULL) != 0) {
        perror("Falha na criação da thread de exibição"); return 1;
    }
    if (pthread_create(&clock_tid, NULL, clock_thread, NULL) != 0) {
        perror("A criação da thread do relógio falhou"); return 1;
    }
    if (pthread_create(&wheel_sim_tid, NULL, wheel_simulator_thread, NULL) != 0) {
        perror("A criação do tópico do Wheel Sim falhou"); return 1;
    }

    printf("\n### Simulador de Ciclo Computador (C/POSIX) ###\n");
    printf("Velocidade de Simulação: %.1f km/h\n", SIMULATED_SPEED_KPH);
    printf("Comandos:\n");
    printf(" 'm': Simula Botão Mode (MODE_INT)\n");
    printf(" 'r': Simula Botão Reset (RESET_INT)\n");
    printf(" 'q': Sair\n");
    printf("--------------------------------------------------\n");

    // os comando do simulador
    char cmd;
    while ((cmd = getchar()) != 'q') {
        if (cmd == '\n' || cmd == ' ') continue;

        switch (cmd) {
            case 'm':
                handle_mode_int();
                break;
            case 'r':
                handle_reset_int();
                break;
            default:
                printf("Comando desconhecido: %c\n", cmd);
        }
    }

    // liberação e Encerramento
    printf("\nSimulador finalizado...\n");
    g_running = 0; // encerra as threads
    
    pthread_join(display_tid, NULL);
    pthread_join(clock_tid, NULL);
    pthread_join(wheel_sim_tid, NULL); 
    
    pthread_mutex_destroy(&g_data_mutex);

    printf("Guarde sua bicleta.\n");
    return 0;
}