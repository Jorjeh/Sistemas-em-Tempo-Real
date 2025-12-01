with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q5g is
   N, Max : Integer;
begin
   Put("Digite a quantidade de elementos para o array: ");
   Get(N);

   declare
      Arr : array(1 .. N) of Integer;
   begin
      Put_Line("Digite valores para o array:");
      for I in 1 .. N loop
         Put("Elemento(s) do array " & Integer'Image(I) & ": ");
         Get(Arr(I));
      end loop;

      Max := Arr(1);
      for I in 2 .. N loop
         if Arr(I) > Max then
            Max := Arr(I);
         end if;
      end loop;

      Put("Maior elemento encontrado no array: ");
      Put(Max);
      New_Line;
   end;
end q5g;
