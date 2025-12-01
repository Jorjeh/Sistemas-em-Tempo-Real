with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Q5e is
   Max_Size : constant := 100;
   A, B    : array(1 .. Max_Size) of Integer;
   N       : Integer;
   Produto : Integer := 0;
begin
   Put("Digite o tamanho dos vetores: ");
   Get(N);

   Put_Line("Informe os elementos do vetor A:");
   for I in 1 .. N loop
      Get(A(I));
   end loop;

   Put_Line("Informe os elementos do vetor B:");
   for I in 1 .. N loop
      Get(B(I));
   end loop;

   for I in 1 .. N loop
      Produto := Produto + A(I) * B(I);
   end loop;

   Put_Line("Produto interno: " & Integer'Image(Produto));
end Q5e;

