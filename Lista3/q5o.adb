with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure q5o is
   M, N    : Integer;
   Count   : Integer := 0;
begin

   Put("Informe o número de linhas: ");
   Get(M);
   Put("Informe o número de colunas: ");
   Get(N);

   declare
      type Matrix is array (1 .. M, 1 .. N) of Integer;
      Mat : Matrix;
   begin

      Put_Line("Informe os elementos das matriz:");
      for I in 1 .. M loop
         for J in 1 .. N loop
            Get(Mat(I, J));
            if Mat(I, J) = 0 then
               Count := Count + 1;
            end if;
         end loop;
      end loop;

      declare
         Percent : Float := Float(Count) / Float(M * N) * 100.0;
      begin
         Put("O total de Porcentagem de elementos nulos é: ");
         Put(Percent, Aft => 2, Exp => 0);
         Put_Line("%");
      end;
   end;
end q5o;
