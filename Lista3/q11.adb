with Ada.Text_IO; use Ada.Text_IO;
with Stacks; use Stacks;

procedure q11 is
   S : Stack;
begin
   Put_Line("### Teste do Stacks ###");

   if Is_Empty(S) then
      Put_Line("Pilha inicial vazia!");
   end if;

   Put_Line("Empilhando valores...");
   Push(S, Element_Type(20));  -- Conversão para Element_Type
   Push(S, Element_Type(30));  -- Conversão para Element_Type
   Push(S, Element_Type(40));  -- Conversão para Element_Type

   Put_Line("Inicio da pilha: " & Integer'Image(Integer(Top(S))));

   Pop(S);
   Put_Line("Novo topo: " & Integer'Image(Integer(Top(S))));

   Pop(S);
   Pop(S);

   if Is_Empty(S) then
      Put_Line("Pilha vazia!");
   end if;

   Put_Line("Acessando topo da pilha vazia...");
   Put_Line("Topo: " & Integer'Image(Integer(Top(S)))); 

exception
   when Underflow =>
      Put_Line("Exceção capturada: pilha vazia.");
end q11;
