with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q5n is
   type Mat3x3 is array (1 .. 3, 1 .. 3) of Integer;
   A, B, Prod : Mat3x3;
   Is_Inverse : Boolean := True;
begin
   
   Put_Line("Informe os elementos da matriz A [33]:");
   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         Get(A(I, J));
      end loop;
   end loop;

   Put_Line("Informe os elementos da matriz B [3x3]:");
   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         Get(B(I, J));
      end loop;
   end loop;

   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         Prod(I, J) := 0;
         for K in 1 .. 3 loop
            Prod(I, J) := Prod(I, J) + A(I, K) * B(K, J);
         end loop;
      end loop;
   end loop;

   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         if (I = J and Prod(I, J) /= 1) or else (I /= J and Prod(I, J) /= 0) then
            Is_Inverse := False;
         end if;
      end loop;
   end loop;

   if Is_Inverse then
      Put_Line("As matrizes são inversas uma da outra.");
   else
      Put_Line("As matrizes não são inversas uma da outra.");
   end if;

   Put_Line("Produto das matrizes A x B:");
   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         Put(Prod(I, J), Width => 5);
      end loop;
      New_Line;
   end loop;
end q5n;
