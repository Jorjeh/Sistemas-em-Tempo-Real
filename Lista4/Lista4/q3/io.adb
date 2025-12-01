-- io.adb
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

package body IO is

   -- gerar de números aleatórios para simular sensores
   subtype Temp_Range is Integer range 10..500;
   package Random_Temp is new Ada.Numerics.Discrete_Random(Temp_Range);
   Temp_Gen : Random_Temp.Generator;
   
   subtype Press_Range is Integer range 0..750;
   package Random_Press is new Ada.Numerics.Discrete_Random(Press_Range);
   Press_Gen : Random_Press.Generator;

   -- lê temperatura do ADC (simulado)
   procedure Read_Temp(TV : out TemperatureValue) is
   begin
      TV := TemperatureValue(Random_Temp.Random(Temp_Gen));
   end Read_Temp;

   -- lê pressão do ADC (simulado)
   procedure Read_Pressure(PV : out PressureValue) is
   begin
      PV := PressureValue(Random_Press.Random(Press_Gen));
   end Read_Pressure;

   -- define aquecimento (switch digital)
   procedure Set_Heating(HP : in HeatingPosition) is
   begin
      Ada.Text_IO.Put("   [ATUADOR] Aquecimento: ");
      Ada.Text_IO.Put_Line(HeatingPosition'Image(HP));
   end Set_Heating;

   -- define válvula (DAC)
   procedure Set_Valve(VP : in ValvePosition) is
   begin
      Ada.Text_IO.Put("   [ATUADOR] Válvula: ");
      Ada.Integer_Text_IO.Put(Integer(VP), Width => 0);
      Ada.Text_IO.New_Line;
   end Set_Valve;

   -- mostra temperatura no display LCD
   procedure Show_Temp(TV : in TemperatureValue) is
   begin
      Ada.Text_IO.Put("   [DISPLAY] Temperatura: ");
      Ada.Integer_Text_IO.Put(Integer(TV), Width => 0);
      Ada.Text_IO.Put_Line(" °C");
   end Show_Temp;

   -- mostra pressão no display LCD
   procedure Show_Pressure(PV : in PressureValue) is
   begin
      Ada.Text_IO.Put("   [DISPLAY] Pressão: ");
      Ada.Integer_Text_IO.Put(Integer(PV), Width => 0);
      Ada.Text_IO.Put_Line(" bar");
   end Show_Pressure;

begin
   -- inicializa geradores aleatórios
   Random_Temp.Reset(Temp_Gen);
   Random_Press.Reset(Press_Gen);
end IO;