with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q5k is
   M, N : Integer;
begin
   -- Leitura das dimensões
   Put("Informe o número de linhas: ");
   Get(M);
   Put("Informe o número de colunas: ");
   Get(N);

   declare
      type Matrix is array (Positive range <>, Positive range <>) of Integer;
      Mat   : Matrix(1 .. M, 1 .. N);
      Trans : Matrix(1 .. N, 1 .. M);
   begin
     
      Put_Line("Informe o(s) elemento(s) da matriz:");
      for I in 1 .. M loop
         for J in 1 .. N loop
            Get(Mat(I, J));
         end loop;
      end loop;

      for I in 1 .. M loop
         for J in 1 .. N loop
            Trans(J, I) := Mat(I, J);
         end loop;
      end loop;

      Put_Line("A Matriz transposta e:");
      for I in 1 .. N loop
         for J in 1 .. M loop
            Put(Trans(I, J), Width => 5);
         end loop;
         New_Line;
      end loop;
   end;
end q5k;
