package Retangulo is

   Invalid_Value : exception;
   type T_Retangulo is private;

   -- modifica modificam comprimento e largura
   procedure Set_Comprimento(R : in out T_Retangulo; C : Float);
   procedure Set_Largura(R : in out T_Retangulo; L : Float);

   -- checa comprimento e largura
   function Get_Comprimento(R : T_Retangulo) return Float;
   function Get_Largura(R : T_Retangulo) return Float;

   function Perimetro(R : T_Retangulo) return Float;
   function Area(R : T_Retangulo) return Float;

   -- checa se é quadrado
   function Quadrado(R : T_Retangulo) return Boolean;

   -- Construtor
   function Criar_Retangulo(C : Float := 1.0; L : Float := 1.0) return T_Retangulo;

private
   type T_Retangulo is record
      Comprimento : Float := 1.0;
      Largura     : Float := 1.0;
   end record;

end Retangulo;
