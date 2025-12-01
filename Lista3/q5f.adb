with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure q5f is
   strA, strB    : String(1 .. 100);
   LeA, LeB : Natural;
begin
   Put("Digite um valor para a string A: ");
   Get_Line(strA, LeA);

   Put("Digite um valor para a string B: ");
   Get_Line(strB, LeB);

   if Index(strA(1 .. LeA), strB(1 .. LeB)) > 0 then
      Put_Line("A string B esta contida na string A!");
   else
      Put_Line("A string B nao esta contida na string A!");
   end if;
end q5f;
