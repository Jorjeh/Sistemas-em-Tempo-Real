package Producer is

   -- tarefa Producer com dois pontos de entrada
   task type Producer_Task is
      
      -- chamada Order: recebe ordens para imprimir caracteres
      entry Order (
         Char       : in Character;           
         Count      : in Positive := 10;      
         Delay_Time : in Duration := 0.0      
      );
      
      -- chamada control: controla término
      entry Control (
	-- true = terminar, false = continuar
         Terminate_Task : in Boolean          
      );
      
   end Producer_Task;

end Producer;
