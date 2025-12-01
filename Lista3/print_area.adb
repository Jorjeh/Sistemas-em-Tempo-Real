with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Objects; use Objects;

procedure Print_Area(O : in Object'Class) is
begin
   Put("Área: ");
   Put(Area(O), Aft => 2, Exp => 0);
   New_Line;
end Print_Area;
