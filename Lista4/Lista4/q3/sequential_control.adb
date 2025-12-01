with Ada.Text_IO;
with DataTypes; use DataTypes;
with IO;
with ControlAlgorithms;

procedure Sequential_Control is

   -- variáveis globais
   Current_Temperature : TemperatureValue;
   Current_Pressure    : PressureValue;
   Heating_Control     : HeatingPosition;
   Valve_Control       : ValvePosition;
   
   Cycle_Count : Natural := 0;
   Max_Cycles  : constant Natural := 20;  -- Número de ciclos de execução

begin
   Ada.Text_IO.Put_Line("##################################");
   Ada.Text_IO.Put_Line("# Sistema de Controle Sequencial #");
   Ada.Text_IO.Put_Line("##################################");
   Ada.Text_IO.New_Line;
   
   -- Loop principal
   for I in 1 .. Max_Cycles loop
      Cycle_Count := I;
      
      Ada.Text_IO.Put_Line("----------------------------------------");
      Ada.Text_IO.Put("Ciclo #");
      Ada.Text_IO.Put_Line(Natural'Image(Cycle_Count));
      Ada.Text_IO.Put_Line("----------------------------------------");
      
      -- processo T: Controle de Temperatura
      Ada.Text_IO.Put_Line("[Processo T] Iniciando controle de temperatura...");
      
      -- ler temperatura do sensor (ADC)
      IO.Read_Temp(Current_Temperature);
      
      -- calcula setpoint do aquecimento
      ControlAlgorithms.Calculate_Heating_Setpoint(Current_Temperature, 
                                                    Heating_Control);
      
      -- enviar comando para o aquecimento (switch digital)
      IO.Set_Heating(Heating_Control);
      
      Ada.Text_IO.New_Line;
      
      -- processo P: Controle de Pressão
      Ada.Text_IO.Put_Line("[Processo P] Iniciando controle de pressão...");
      
      -- ler pressão do sensor (ADC)
      IO.Read_Pressure(Current_Pressure);
      
      -- calcular setpoint da válvula
      ControlAlgorithms.Calculate_Valve_Setpoint(Current_Pressure, 
                                                  Valve_Control);
      
      -- envia comando para a válvula (DAC)
      IO.Set_Valve(Valve_Control);
      
      Ada.Text_IO.New_Line;
      
      -- processo S: Display
      Ada.Text_IO.Put_Line("[Processo S] Atualizando display...");
      
      -- mostrar temperatura no LCD
      IO.Show_Temp(Current_Temperature);
      
      -- mostrar pressão no LCD
      IO.Show_Pressure(Current_Pressure);
      
      Ada.Text_IO.New_Line;
      
      -- Delay entre ciclos (simula período de amostragem)
      delay 0.5;
   end loop;
   
   Ada.Text_IO.Put_Line("######################");
   Ada.Text_IO.Put_Line("# Sistema Finalizado #");
   Ada.Text_IO.Put_Line("######################");
   
end Sequential_Control;
