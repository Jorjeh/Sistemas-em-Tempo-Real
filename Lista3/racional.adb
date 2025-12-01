with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Racional is

   function MDC(A, B : Integer) return Integer is
      TempA : Integer := abs(A);
      TempB : Integer := abs(B);
      R     : Integer;
   begin
      while TempB /= 0 loop
         R := TempA mod TempB;
         TempA := TempB;
         TempB := R;
      end loop;
      return TempA;
   end MDC;

   procedure Reduzir(R : in out T_Racional) is
      G : Integer := MDC(R.Numerador, R.Denominador);
   begin
      R.Numerador := R.Numerador / G;
      R.Denominador := R.Denominador / G;

      if R.Denominador < 0 then
         R.Numerador := -R.Numerador;
         R.Denominador := -R.Denominador;
      end if;
   end Reduzir;

   function Criar_Racional(N : Integer := 0; D : Integer := 1) return T_Racional is
      R : T_Racional;
   begin
      if D = 0 then
         raise Invalid_Denominator;
      end if;
      R.Numerador := N;
      R.Denominador := D;
      Reduzir(R);
      return R;
   end Criar_Racional;

   function Adicao(R1, R2 : T_Racional) return T_Racional is
      N : Integer := R1.Numerador * R2.Denominador + R2.Numerador * R1.Denominador;
      D : Integer := R1.Denominador * R2.Denominador;
   begin
      return Criar_Racional(N, D);
   end Adicao;

   function Subtracao(R1, R2 : T_Racional) return T_Racional is
      N : Integer := R1.Numerador * R2.Denominador - R2.Numerador * R1.Denominador;
      D : Integer := R1.Denominador * R2.Denominador;
   begin
      return Criar_Racional(N, D);
   end Subtracao;

   function Multiplicacao(R1, R2 : T_Racional) return T_Racional is
      N : Integer := R1.Numerador * R2.Numerador;
      D : Integer := R1.Denominador * R2.Denominador;
   begin
      return Criar_Racional(N, D);
   end Multiplicacao;

   function Divisao(R1, R2 : T_Racional) return T_Racional is
   begin
      if R2.Numerador = 0 then
         raise Invalid_Denominator; -- divisão por zero
      end if;
      return Criar_Racional(R1.Numerador * R2.Denominador,
                            R1.Denominador * R2.Numerador);
   end Divisao;

   procedure Imprimir_Fracao(R : T_Racional) is
   begin
      Put(Integer'Image(R.Numerador) & " /" & Integer'Image(R.Denominador));
      New_Line;
   end Imprimir_Fracao;

   procedure Imprimir_Float(R : T_Racional) is
      F : Float := Float(R.Numerador) / Float(R.Denominador);
   begin
      -- Formatação para evitar notação científica
      if F >= 0.0 then
         Put(" ");
      end if;
      Put(F, Fore => 1, Aft => 5, Exp => 0);
      New_Line;
   end Imprimir_Float;

end Racional;
