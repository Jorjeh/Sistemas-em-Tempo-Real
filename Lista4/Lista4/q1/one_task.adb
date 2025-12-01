with Ada.Text_IO; use Ada.Text_IO;

procedure One_Task is

   -- declaração da tarefa com discriminador mensagem
   task type Hello_Task (mensagem : Character);

   -- tarefa Hello_Task
   task body Hello_Task is
   begin
      Put ("Hello, I am Task ");
      Put (mensagem);
      New_Line;
   end Hello_Task;

   -- instânciando a tarefa com parâmetro 'A'
   Task_A : Hello_Task ('A');

begin
   null; 
end One_Task;
