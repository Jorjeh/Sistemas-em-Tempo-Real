-- io.ads
with DataTypes; use DataTypes;

package IO is
   procedure Read_Temp(TV : out TemperatureValue);      -- do ADC
   procedure Read_Pressure(PV : out PressureValue);     -- do ADC
   procedure Set_Heating(HP : in HeatingPosition);      -- para switch
   procedure Set_Valve(VP : in ValvePosition);          -- para DAC
   procedure Show_Temp(TV : in TemperatureValue);       -- para display
   procedure Show_Pressure(PV : in PressureValue);      -- para display
end IO;