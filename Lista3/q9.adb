with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Queues;

procedure q9 is
   
   package Integer_Queues is new Queues(Element_Type => Integer);
   use Integer_Queues;
   
   My_Queue : Queue;
   Value    : Integer;
begin
   Put_Line("### Teste da Implementacao de Fila ###");
   
   Initialize(My_Queue);
   Put_Line("Fila vazia? " & Boolean'Image(Is_Empty(My_Queue)));
   
   Enqueue(My_Queue, 20);
   Enqueue(My_Queue, 40);
   Enqueue(My_Queue, 60);
   
   Put_Line("### ENQUEUE (20, 40, 60) ###");
   Put_Line("Tamanho atual: " & Natural'Image(Length(My_Queue))); 
   
   -- Consultar e Remover
   Put_Line("Frente da fila: " & Integer'Image(Front(My_Queue)));
   
   Dequeue(My_Queue, Value);
   Put_Line("Dequeue (removido): " & Integer'Image(Value));
   
   Put_Line("Tamanho atual: " & Natural'Image(Length(My_Queue)));
   
   Dequeue(My_Queue, Value);
   Put_Line("Dequeue (removido): " & Integer'Image(Value));
   
   Dequeue(My_Queue, Value);
   Put_Line("Dequeue (removido): " & Integer'Image(Value));

   Put_Line("### Esvaziando ###");
   Put_Line("Fila vazia? " & Boolean'Image(Is_Empty(My_Queue)));
   
end q9;
