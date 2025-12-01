with Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with DataTypes; use DataTypes;
with IO;
with ControlAlgorithms;

procedure Concurrent_Control is
   -- protected Object para compartilhamento de dados
   protected Shared_Data is
      -- procedimentos para escrita
      procedure Set_Temperature(TV : in TemperatureValue);
      procedure Set_Pressure(PV : in PressureValue);
      
      -- funções de leitura
      function Get_Temperature return TemperatureValue;
      function Get_Pressure return PressureValue;
      
   private
      Temperature : TemperatureValue := 100;
      Pressure    : PressureValue := 100;
   end Shared_Data;

   protected body Shared_Data is
      procedure Set_Temperature(TV : in TemperatureValue) is
      begin
         Temperature := TV;
      end Set_Temperature;

      procedure Set_Pressure(PV : in PressureValue) is
      begin
         Pressure := PV;
      end Set_Pressure;

      function Get_Temperature return TemperatureValue is
      begin
         return Temperature;
      end Get_Temperature;

      function Get_Pressure return PressureValue is
      begin
         return Pressure;
      end Get_Pressure;
   end Shared_Data;

   -- tAREFA T: controla temperatura
   task Temperature_Control is
      entry Start;
      entry Stop;
   end Temperature_Control;

   task body Temperature_Control is
      Current_Temp    : TemperatureValue;
      Heating_Ctrl    : HeatingPosition;
      Period          : constant Time_Span := Milliseconds(500);
      Next_Time       : Time;
      Active          : Boolean := False;
   begin
      -- aguarda comando start
      accept Start do
         Active := True;
         Ada.Text_IO.Put_Line("[Tarefa T] Iniciada - Controle de Temperatura");
      end Start;
      
      Next_Time := Clock + Period;
      
      -- loop do controle periódico
      while Active loop
         select
            accept Stop do
               Active := False;
               Ada.Text_IO.Put_Line("[Tarefa T] Encerrando...");
            end Stop;
         or
            delay until Next_Time;
            
            -- ler temperatura do ADC
            IO.Read_Temp(Current_Temp);
            
            -- armazenar na memória compartilhada
            Shared_Data.Set_Temperature(Current_Temp);
            
            -- calcula setpoint do aquecimento
            ControlAlgorithms.Calculate_Heating_Setpoint(Current_Temp, 
                                                          Heating_Ctrl);
            
            -- envia comando para atuador
            IO.Set_Heating(Heating_Ctrl);
            
            -- próximo período
            Next_Time := Next_Time + Period;
         end select;
      end loop;
      
      Ada.Text_IO.Put_Line("[Tarefa T] Finalizada");
      
   exception
      when others =>
         Ada.Text_IO.Put_Line("[Tarefa T] ERRO - Exceção não tratada");
   end Temperature_Control;

   -- TAREFA P: controle de pressão
   task Pressure_Control is
      entry Start;
      entry Stop;
   end Pressure_Control;

   task body Pressure_Control is
      Current_Press   : PressureValue;
      Valve_Ctrl      : ValvePosition;
      Period          : constant Time_Span := Milliseconds(500);
      Next_Time       : Time;
      Active          : Boolean := False;
   begin
      -- aguarda start
      accept Start do
         Active := True;
         Ada.Text_IO.Put_Line("[Tarefa P] Iniciada - Controle de Pressão");
      end Start;
      
      Next_Time := Clock + Period;
      
      -- loop do controle periódico
      while Active loop
         select
            accept Stop do
               Active := False;
               Ada.Text_IO.Put_Line("[Tarefa P] Encerrando...");
            end Stop;
         or
            delay until Next_Time;
            
            -- ler pressão do ADC
            IO.Read_Pressure(Current_Press);
            
            -- armazenar na memória compartilhada
            Shared_Data.Set_Pressure(Current_Press);
            
            -- calcula setpoint da válvula
            ControlAlgorithms.Calculate_Valve_Setpoint(Current_Press, 
                                                        Valve_Ctrl);
            
            -- evia para o atuador
            IO.Set_Valve(Valve_Ctrl);
            
            -- próximo período
            Next_Time := Next_Time + Period;
         end select;
      end loop;
      
      Ada.Text_IO.Put_Line("[Tarefa P] Finalizada");
      
   exception
      when others =>
         Ada.Text_IO.Put_Line("[Tarefa P] ERRO - Exceção não tratada");
   end Pressure_Control;

   -- TAREFA S: Display (mostrar dados)
   task Display_Task is
      entry Start;
      entry Stop;
   end Display_Task;

   task body Display_Task is
      Temp_Value      : TemperatureValue;
      Press_Value     : PressureValue;
      Period          : constant Time_Span := Milliseconds(1000);
      Next_Time       : Time;
      Active          : Boolean := False;
   begin
      -- aguarda start
      accept Start do
         Active := True;
         Ada.Text_IO.Put_Line("[Tarefa S] Iniciada - Display LCD");
      end Start;
      
      Next_Time := Clock + Period;
      
      -- laço de atualização do display
      while Active loop
         select
            accept Stop do
               Active := False;
               Ada.Text_IO.Put_Line("[Tarefa S] Encerrando...");
            end Stop;
         or
            delay until Next_Time;
            
            -- ler valores da memória compartilhada
            Temp_Value := Shared_Data.Get_Temperature;
            Press_Value := Shared_Data.Get_Pressure;
            
            -- atualzia display LCD
            Ada.Text_IO.Put_Line(">>> Display atualizado <<<");
            IO.Show_Temp(Temp_Value);
            IO.Show_Pressure(Press_Value);
            Ada.Text_IO.Put_Line("-------------------------------");
            
            -- próximo período
            Next_Time := Next_Time + Period;
         end select;
      end loop;
      
      Ada.Text_IO.Put_Line("[Tarefa S] Finalizada");
      
   exception
      when others =>
         Ada.Text_IO.Put_Line("[Tarefa S] ERRO - Exceção não tratada");
   end Display_Task;

begin
   Ada.Text_IO.Put_Line("Sistema de controle concorrente....");
   Ada.Text_IO.New_Line;
   
   -- inicia todas as tarefas
   Temperature_Control.Start;
   Pressure_Control.Start;
   Display_Task.Start;
   
   Ada.Text_IO.Put_Line("Tarefas iniciadas");
   Ada.Text_IO.Put_Line("Sistema operando por 10 segundos...");
   Ada.Text_IO.New_Line;
   
   delay 10.0;
   
   -- para todas as tarefas
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Encerrando sistema...");
   
   Temperature_Control.Stop;
   Pressure_Control.Stop;
   Display_Task.Stop;
   
   delay 1.0;
   
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("Sistema finalizado...");
   
end Concurrent_Control;