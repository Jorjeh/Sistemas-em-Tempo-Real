with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q5l is
   M, N, P, Q : Integer;
begin
  
   Put("Informe valores para a matriz M e N: ");
   Get(M);
   Get(N);

   Put("Informe pxq para a matriz B: ");
   Get(P);
   Get(Q);

   if N /= P then
      Put_Line("Erro com as Dimensões das matrizes.");
      return;
   end if;

   declare
      type Matrix_A is array (1 .. M, 1 .. N) of Integer;
      type Matrix_B is array (1 .. P, 1 .. Q) of Integer;
      type Matrix_C is array (1 .. M, 1 .. Q) of Integer;

      A : Matrix_A;
      B : Matrix_B;
      C : Matrix_C := (others => (others => 0));
   begin
     
      Put_Line("Informe os elementos da matriz A:");
      for I in 1 .. M loop
         for J in 1 .. N loop
            Get(A(I, J));
         end loop;
      end loop;

      Put_Line("Informe os elementos da matriz B:");
      for I in 1 .. P loop
         for J in 1 .. Q loop
            Get(B(I, J));
         end loop;
      end loop;

      for I in 1 .. M loop
         for J in 1 .. Q loop
            for K in 1 .. N loop
               C(I, J) := C(I, J) + A(I, K) * B(K, J);
            end loop;
         end loop;
      end loop;

      Put_Line("Matriz resultante (C = A x B):");
      for I in 1 .. M loop
         for J in 1 .. Q loop
            Put(C(I, J), Width => 5);
         end loop;
         New_Line;
      end loop;
   end;
end q5l;
