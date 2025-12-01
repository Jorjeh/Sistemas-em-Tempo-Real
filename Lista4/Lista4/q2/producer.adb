with Ada.Text_IO;

package body Producer is

   task body Producer_Task is
      -- Flag de controle de término & informa se há ordem ativa
      Should_Terminate : Boolean := False;   
      Active_Order     : Boolean := False;   
      
      -- parâmetros da ordem atual
      Current_Char      : Character;
      Current_Count     : Positive;
      Current_Delay     : Duration;
      
   begin
      
      Ada.Text_IO.Put_Line("[Producer] Aguardando ordens...");
      
      -- loop principal
      Main_Loop:
      loop
         
         select
            when not Active_Order and not Should_Terminate =>
               accept Order (
                  Char       : in Character;
                  Count      : in Positive := 10;
                  Delay_Time : in Duration := 0.0
               ) do
                  -- Armazenar os parâmetros da ordem
                  Current_Char  := Char;
                  Current_Count := Count;
                  Current_Delay := Delay_Time;
                  Active_Order  := True;
                  
                  Ada.Text_IO.Put_Line(
                     "[Producer] Ordem recebida: '" & Char & 
                     "' x" & Positive'Image(Count) & 
                     " (delay:" & Duration'Image(Delay_Time) & "s)"
                  );
               end Order;
               
         or
            accept Control (Terminate_Task : in Boolean) do
               Should_Terminate := Terminate_Task;
               
               if Terminate_Task then
                  Ada.Text_IO.Put_Line("[Producer] Comando de término recebido.");
               else
                  Ada.Text_IO.Put_Line("[Producer] Controle: pronto para nova ordem.");
               end if;
            end Control;
            
         or
            delay 0.1;
            
         end select;
         
         if Active_Order then
            
            Ada.Text_IO.Put("[Producer] Executando: ");
            
            for I in 1 .. Current_Count loop
               Ada.Text_IO.Put(Current_Char);
               Ada.Text_IO.Flush; -- Forçar saída imediata
               
               -- Aplicar retardo se especificado (exceto após última impressão)
               if I < Current_Count and then Current_Delay > 0.0 then
                  delay Current_Delay;
               end if;
            end loop;
            
            Ada.Text_IO.New_Line;
            Ada.Text_IO.Put_Line("[Producer] Ordem concluída.");
            
            -- Marcar ordem como concluída
            Active_Order := False;
            
         end if;
         
         exit Main_Loop when Should_Terminate and not Active_Order;
         
      end loop Main_Loop;
      
      Ada.Text_IO.Put_Line("[Producer] Tarefa finalizada.");
      
   exception
      when others =>
         Ada.Text_IO.Put_Line("[Producer] ERRO: Exceção capturada. Finalizando.");
   end Producer_Task;

end Producer;
