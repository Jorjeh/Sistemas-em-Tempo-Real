with Ada.Text_IO; use Ada.Text_IO;
with Generic_Stacks;

procedure q12 is
   package Int_Stack_Pkg is new Generic_Stacks(Element_Type => Integer);
   S_Int : Int_Stack_Pkg.Stack;

   package Char_Stack_Pkg is new Generic_Stacks(Element_Type => Character);
   S_Char : Char_Stack_Pkg.Stack;

begin
   Put_Line("### Pilha de Inteiros ###");
   Int_Stack_Pkg.Push(S_Int, 20);
   Int_Stack_Pkg.Push(S_Int, 30);
   Int_Stack_Pkg.Push(S_Int, 40);

   Put_Line("Topo: " & Integer'Image(Int_Stack_Pkg.Top(S_Int)));
   Int_Stack_Pkg.Pop(S_Int);
   Put_Line("Após Pop, topo: " & Integer'Image(Int_Stack_Pkg.Top(S_Int)));

   Int_Stack_Pkg.Pop(S_Int);
   Int_Stack_Pkg.Pop(S_Int);
   if Int_Stack_Pkg.Is_Empty(S_Int) then
      Put_Line("Pilha de inteiros vazia.");
   end if;

   Put_Line("");
   Put_Line("### Pilha de Caracteres ###");
   Char_Stack_Pkg.Push(S_Char, 'A');
   Char_Stack_Pkg.Push(S_Char, 'B');
   Char_Stack_Pkg.Push(S_Char, 'C');

   Put_Line("Topo: '" & Char_Stack_Pkg.Top(S_Char) & "'");
   Char_Stack_Pkg.Pop(S_Char);
   Put_Line("Após Pop, topo: '" & Char_Stack_Pkg.Top(S_Char) & "'");

   Char_Stack_Pkg.Pop(S_Char);
   Char_Stack_Pkg.Pop(S_Char);
   if Char_Stack_Pkg.Is_Empty(S_Char) then
      Put_Line("Pilha esta vazia.");
   end if;

   begin
      Put_Line("");
      Put_Line("Testando pilha de inteiros...");
      Int_Stack_Pkg.Pop(S_Int); 
   exception
      when Int_Stack_Pkg.Underflow =>
         Put_Line("Inteiros capturador OK!");
   end;

   begin
      Put_Line("Testando pilha de caracteres...");
      Char_Stack_Pkg.Pop(S_Char); -- Isso deve levantar Underflow
   exception
      when Char_Stack_Pkg.Underflow =>
         Put_Line("Inteiros capturador OK!");
         Put_Line("");
   end;

end q12;
