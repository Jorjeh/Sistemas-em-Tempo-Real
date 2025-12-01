package body ControlAlgorithms is

   Temp_Setpoint : constant Integer := 250;  -- Temperatura alvo: 250°C
   Temp_Hysteresis : constant Integer := 20; -- Histerese: ±20°C
   
   Press_Setpoint : constant Integer := 375; -- Pressão alvo: 375 bar
   Press_Scale : constant Integer := 75;     -- Escala para cálculo da válvula

   procedure Calculate_Heating_Setpoint(TV : in TemperatureValue;
                                        HP : out HeatingPosition) is
   begin
      if Integer(TV) < (Temp_Setpoint - Temp_Hysteresis) then
         HP := On;   -- Temperatura muito baixa -> Liga aquecimento
      elsif Integer(TV) > (Temp_Setpoint + Temp_Hysteresis) then
         HP := Off;  -- Temperatura muito alta -> Desliga aquecimento
      else
         HP := Off;  -- Dentro da faixa aceitável -> Mantém desligado
      end if;
   end Calculate_Heating_Setpoint;

   procedure Calculate_Valve_Setpoint(PV : in PressureValue;
                                      VP : out ValvePosition) is
      Error : Integer;
      Position : Integer;
   begin
      Error := Press_Setpoint - Integer(PV);
      
      Position := (Error / Press_Scale) + 5;  -- Centro em 5
 
      -- limita entre 0 e 9
      if Position < 0 then
         Position := 0;
      elsif Position > 9 then
         Position := 9;
      end if;
      
      VP := ValvePosition(Position);
   end Calculate_Valve_Setpoint;

end ControlAlgorithms;