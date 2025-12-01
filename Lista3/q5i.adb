with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure q5i is
   M, N : Integer;
   Sum  : Float := 0.0;
begin
   Put("informe a quantidade de linhas: ");
   Ada.Integer_Text_IO.Get(M);

   Put("Informe a quantidade de colunas: ");
   Ada.Integer_Text_IO.Get(N);

   declare
      Mat : array(1 .. M, 1 .. N) of Float;
   begin
      Put_Line("Infome os elementos da matriz:");

      for I in 1 .. M loop
         for J in 1 .. N loop
            Put("Elemento(s) ["); Put(I); Put(","); Put(J); Put("]: ");
            Ada.Float_Text_IO.Get(Mat(I, J));
            Sum := Sum + Mat(I, J);
         end loop;
      end loop;

      Put("Média obtida dos elemento(s): ");
      Ada.Float_Text_IO.Put(Sum / Float(M * N), Aft => 2, Exp => 0);
      New_Line;
   end;
end q5i;
