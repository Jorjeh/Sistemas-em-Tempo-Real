with Ada.Text_IO; use Ada.Text_IO;

procedure One_Task_c is

   task type Hello_Task (mensagem : Character; amount : Natural) is
      entry start;  -- ponto de sincronização
   end Hello_Task;

   task body Hello_Task is
   begin
      accept start;  -- espera pela ativação explícita
      for I in 1 .. amount loop
         Put ("Hello, I am Task ");
         Put (mensagem);
         New_Line;
         delay 0.5;
      end loop;
   end Hello_Task;

   Task_A : Hello_Task ('A', 5);
   Task_B : Hello_Task ('B', 7);

begin
   -- Ativa as tarefas na sequência desejada
   Task_A.start;
   Task_B.start;
end One_Task_c;
