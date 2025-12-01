with Ada.Text_IO; use Ada.Text_IO;
with Retangulo; use Retangulo;

procedure q13 is
   R : T_Retangulo;
begin
   -- Criar retângulo padrão
   R := Criar_Retangulo;
   Put_Line("Retangulo padrão:");
   Put_Line("Comprimento: " & Float'Image(Get_Comprimento(R)));
   Put_Line("Largura    : " & Float'Image(Get_Largura(R)));
   Put_Line("Area       : " & Float'Image(Area(R)));
   Put_Line("Perimetro  : " & Float'Image(Perimetro(R)));
   Put_Line("Quadrado?  : " & Boolean'Image(Quadrado(R)));

   -- Testar set com valores válidos
   Set_Comprimento(R, 6.0);
   Set_Largura(R, 4.0);
   Put_Line("");
   Put_Line("Retangulo modificado:");
   Put_Line("Comprimento: " & Float'Image(Get_Comprimento(R)));
   Put_Line("Largura    : " & Float'Image(Get_Largura(R)));
   Put_Line("Area       : " & Float'Image(Area(R)));
   Put_Line("Perimetro  : " & Float'Image(Perimetro(R)));
   Put_Line("Quadrado?  : " & Boolean'Image(Quadrado(R)));

exception
   when Invalid_Value =>
      Put_Line("Exception: Valor definido é inválido para uso no comprimento ou largura.");

end q13;
