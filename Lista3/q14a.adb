-- Programa de teste
with racional_pkg; use racional_pkg;
with Ada.Text_IO; use Ada.Text_IO;

procedure q14a is
   A, B, C : Racional;
begin
   A := Criar(7, 5);
   B := Criar(1, 3);

   Put("A = ");
   Imprimir_Fracao(A);

   Put("B = ");
   Imprimir_Fracao(B);

   C := Soma(A, B);
   Put("A + B = ");
   Imprimir_Fracao(C);
   Put("Em ponto flutuante: ");
   Imprimir_Flutuante(C);

   C := Subtrai(A, B);
   Put("A - B = ");
   Imprimir_Fracao(C);

   C := Multiplica(A, B);
   Put("A * B = ");
   Imprimir_Fracao(C);

   C := Divide(A, B);
   Put("A / B = ");
   Imprimir_Fracao(C);
end q14a;

