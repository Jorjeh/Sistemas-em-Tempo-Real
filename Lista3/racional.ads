with Ada.Text_IO; use Ada.Text_IO;

package Racional is

   type T_Racional is private;

   Invalid_Denominator : exception;

   function Criar_Racional(N : Integer := 0; D : Integer := 1) return T_Racional;

   function Adicao(R1, R2 : T_Racional) return T_Racional;
   function Subtracao(R1, R2 : T_Racional) return T_Racional;
   function Multiplicacao(R1, R2 : T_Racional) return T_Racional;
   function Divisao(R1, R2 : T_Racional) return T_Racional;

   procedure Imprimir_Fracao(R : T_Racional);
   procedure Imprimir_Float(R : T_Racional);

private
   type T_Racional is record
      Numerador   : Integer := 0;
      Denominador : Integer := 1;
   end record;

end Racional;
