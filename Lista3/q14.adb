with Ada.Text_IO; use Ada.Text_IO;
with Racional; use Racional;

procedure q14 is
   R1, R2, R3 : T_Racional;
begin
   R1 := Criar_Racional(4, 3);
   R2 := Criar_Racional(2, 4);

   Put_Line("R1: ");
   Imprimir_Fracao(R1);
   Imprimir_Float(R1);

   Put_Line("R2: ");
   Imprimir_Fracao(R2);
   Imprimir_Float(R2);

   -- Adição
   R3 := Adicao(R1, R2);
   Put_Line("Adição R1 + R2: ");
   Imprimir_Fracao(R3);
   Imprimir_Float(R3);

   -- Subtração
   R3 := Subtracao(R1, R2);
   Put_Line("Subtração R1 - R2: ");
   Imprimir_Fracao(R3);
   Imprimir_Float(R3);

   -- Multiplicação
   R3 := Multiplicacao(R1, R2);
   Put_Line("Multiplicação R1 * R2: ");
   Imprimir_Fracao(R3);
   Imprimir_Float(R3);

   -- Divisão
   R3 := Divisao(R1, R2);
   Put_Line("Divisão R1 / R2: ");
   Imprimir_Fracao(R3);
   Imprimir_Float(R3);

exception
   when Invalid_Denominator =>
      Put_Line("Erro: causado por erro no denominador ou divisão por zero.");

end q14;
