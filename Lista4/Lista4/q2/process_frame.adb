with Ada.Text_IO;
with Producer;

procedure Process_Frame is

   -- instâncias das tarefas A e B
   A : Producer.Producer_Task;
   B : Producer.Producer_Task;
   
begin
   
   Ada.Text_IO.Put_Line("####################");
   Ada.Text_IO.Put_Line("# Sistema Producer #");
   Ada.Text_IO.Put_Line("####################");
   Ada.Text_IO.New_Line;
   
   -- fica aguardando a inicialização das tarefas
   delay 0.5;
   
   -- tarefa A imprime "A" 10 vezes sem retardo
   Ada.Text_IO.Put_Line(">>> Tarefa A - 'A' x10 (sem delay)");
   A.Order(Char => 'A', Count => 10, Delay_Time => 0.0);
   
   -- espera a conclusão da ordem
   delay 1.0;
   
   -- tarefa B imprime "B" 10 vezes com retardo de 1.0 segundo
   Ada.Text_IO.Put_Line(">>> Tarefa B - 'B' x10 (delay: 1.0s)");
   B.Order(Char => 'B', Count => 10, Delay_Time => 1.0);
   
   -- aguardar para B começar
   delay 2.0;
   
   -- tarefa A imprime "A" 100 vezes sem retardo
   Ada.Text_IO.Put_Line(">>> Tarefa A - 'A' x100 (sem delay)");
   A.Order(Char => 'A', Count => 100, Delay_Time => 0.0);
   
   -- aguarda a conclusão das ordens de A e B
   delay 11.0;
   
   -- finaliza tarefa B
   Ada.Text_IO.Put_Line(">>> Terminando Tarefa B");
   B.Control(Terminate_Task => True);
   
   delay 1.0;
   
   -- finaliza tarefa A
   Ada.Text_IO.Put_Line(">>> Terminando Tarefa A");
   A.Control(Terminate_Task => True);
   
   delay 1.0;
   
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line("#######################");
   Ada.Text_IO.Put_Line("# Execução concluída #");
   Ada.Text_IO.Put_Line("######################");
   
exception
   when others =>
      Ada.Text_IO.Put_Line("Error: Exceção não tratada.");
      
end Process_Frame;
