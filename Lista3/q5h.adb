with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q5h is
   N : Integer;
begin
   Put("Informe a quantidade de elementos: ");
   Get(N);

   declare
      Arr  : array(1 .. N) of Integer;
      Temp : Integer;
   begin
      Put_Line("Digite valores para os elementos:");
      for I in 1 .. N loop
         Put("Elemento(s) "); Put(I); Put(": ");
         Get(Arr(I));
      end loop;

      for I in 1 .. N - 1 loop
         for J in 1 .. N - I loop
            if Arr(J) > Arr(J + 1) then
               Temp := Arr(J);
               Arr(J) := Arr(J + 1);
               Arr(J + 1) := Temp;
            end if;
         end loop;
      end loop;

      Put_Line("Listagem dos elementos ordenados:");
      for I in 1 .. N loop
         Put(Arr(I)); Put(" ");
      end loop;

      New_Line;
   end;
end q5h;
