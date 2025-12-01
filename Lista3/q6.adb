with Ada.Text_IO; use Ada.Text_IO;
with Print_Area;
with Circles; use Circles;
with Rectangles; use Rectangles;
with Triangles; use Triangles;

procedure q6 is
   C : Circle := (Radius => 4.0);
   R : Rectangle := (Width => 6.0, Height => 5.0);
   T : Triangle := (Base => 8.0, Height => 2.0);
begin
   Put_Line("Círculo:");
   Print_Area(C);

   Put_Line("Retângulo:");
   Print_Area(R);

   Put_Line("Triângulo:");
   Print_Area(T);
end q6;
