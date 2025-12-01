with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q5m is
   N   : Integer;
   Sum : Integer := 0;
begin
   Put("Informe valores para matriz: ");
   Get(N);

   declare
      type Matrix is array (Positive range <>, Positive range <>) of Integer;
      Mat : Matrix(1 .. N, 1 .. N);
   begin
      
      Put_Line("Informe os elementos da matriz:");
      for I in 1 .. N loop
         for J in 1 .. N loop
            Get(Mat(I, J));
         end loop;
      end loop;

      for I in 1 .. N loop
         Sum := Sum + Mat(I, I);
      end loop;

      Put("A Soma da diagonal principal da matriz: ");
      Put(Sum);
      New_Line;
   end;
end q5m;
