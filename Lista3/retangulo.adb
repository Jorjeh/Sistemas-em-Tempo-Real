package body Retangulo is

   -- Função auxiliar para validar dimensões
   function Validar_Valor(V : Float) return Boolean is
   begin
      return (V > 0.0) and (V < 20.0);
   end Validar_Valor;

   -- Construtor
   function Criar_Retangulo(C : Float := 1.0; L : Float := 1.0) return T_Retangulo is
      R : T_Retangulo;
   begin
      Set_Comprimento(R, C);
      Set_Largura(R, L);
      return R;
   end Criar_Retangulo;

   -- Set comprimento
   procedure Set_Comprimento(R : in out T_Retangulo; C : Float) is
   begin
      if not Validar_Valor(C) then
         raise Invalid_Value;
      end if;

      if C >= R.Largura then
         R.Comprimento := C;
      else
         -- se o valor fornecido for menor que largura, troca para manter comprimento >= largura
         R.Comprimento := R.Largura;
         R.Largura := C;
      end if;
   end Set_Comprimento;

   -- Set largura
   procedure Set_Largura(R : in out T_Retangulo; L : Float) is
   begin
      if not Validar_Valor(L) then
         raise Invalid_Value;
      end if;

      if L <= R.Comprimento then
         R.Largura := L;
      else
         -- se valor fornecido maior que comprimento, troca
         R.Largura := R.Comprimento;
         R.Comprimento := L;
      end if;
   end Set_Largura;

   -- Get comprimento
   function Get_Comprimento(R : T_Retangulo) return Float is
   begin
      return R.Comprimento;
   end Get_Comprimento;

   -- Get largura
   function Get_Largura(R : T_Retangulo) return Float is
   begin
      return R.Largura;
   end Get_Largura;

   -- Área
   function Area(R : T_Retangulo) return Float is
   begin
      return R.Comprimento * R.Largura;
   end Area;

   -- Perímetro
   function Perimetro(R : T_Retangulo) return Float is
   begin
      return 2.0 * (R.Comprimento + R.Largura);
   end Perimetro;

   -- Quadrado?
   function Quadrado(R : T_Retangulo) return Boolean is
   begin
      return R.Comprimento = R.Largura;
   end Quadrado;

end Retangulo;
