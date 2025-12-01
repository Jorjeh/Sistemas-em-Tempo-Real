with Ada.Text_IO; use Ada.Text_IO;
with Generic_Queue;

procedure q10 is
   package Int_Queue is new Generic_Queue(Integer, 10);
   Q : Int_Queue.Queue;
   Val : Integer;

begin
   Int_Queue.Initialize(Q);

   Put_Line("Inserindo 10 na fila");
   Int_Queue.Enqueue(Q, 10);

   Put_Line("Inserindo 15 na fila");
   Int_Queue.Enqueue(Q, 15);

   Int_Queue.Dequeue(Q, Val);
   Put_Line("Valor retirado: " & Integer'Image(Val));

   Int_Queue.Dequeue(Q, Val);
   Put_Line("Valor retirado: " & Integer'Image(Val));
end q10;
