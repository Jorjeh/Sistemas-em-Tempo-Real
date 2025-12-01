with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q5j is
   M, N, P, Q : Integer;
begin
   Put("Informe as dimensoes da matriz M e N: ");
   Get(M);
   Get(N);

   Put("Informe PxQ para forma as (dimensoes para B): ");
   Get(P);
   Get(Q);

   -- Verificação se e possivel realizar a soma
   if M /= P or else N /= Q then
      Put_Line("Nao e possivel realizar a soma, erro nas dimensões da matriz.");
      return;
   end if;

   -- Declaração das matrizes
   declare
      type Matrix is array (1 .. M, 1 .. N) of Integer;
      A, B, C : Matrix;
   begin
      Put_Line("Informe os elementos da matriz A:");
      for I in 1 .. M loop
         for J in 1 .. N loop
            Get(A(I, J));
         end loop;
      end loop;

      Put_Line("informe os elementos da matriz B:");
      for I in 1 .. M loop
         for J in 1 .. N loop
            Get(B(I, J));
         end loop;
      end loop;

      Put_Line("Matriz C = A + B:");
      for I in 1 .. M loop
         for J in 1 .. N loop
            C(I, J) := A(I, J) + B(I, J);
            Put(C(I, J), Width => 5);
         end loop;
         New_Line;
      end loop;
   end;
end q5j;
