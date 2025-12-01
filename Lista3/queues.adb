with Ada.Unchecked_Deallocation;

package body Queues is
   procedure Free is new Ada.Unchecked_Deallocation (Object => Node, Name => Node_Access);

   procedure Initialize (The_Queue : out Queue) is
   begin
      The_Queue.Head := null;
      The_Queue.Tail := null;
      The_Queue.Count := 0;
   end Initialize;

   procedure Enqueue (The_Queue : in out Queue; Item : in Element_Type) is
      New_Node : Node_Access;
   begin
      New_Node := new Node'(Value => Item, Next => null);

      if The_Queue.Head = null then
         The_Queue.Head := New_Node;
         The_Queue.Tail := New_Node;
      else
         The_Queue.Tail.Next := New_Node;
         The_Queue.Tail := New_Node; -- O novo nó se torna a nova cauda.
      end if;

      The_Queue.Count := The_Queue.Count + 1;
   end Enqueue;

   procedure Dequeue (The_Queue : in out Queue; Item : out Element_Type) is
      Old_Head : Node_Access;
   begin
      if Is_Empty(The_Queue) then
         raise Queue_Error with "Tentativa de Dequeue em fila vazia.";
      end if;

      Old_Head := The_Queue.Head;

      Item := Old_Head.Value;

      The_Queue.Head := Old_Head.Next;

      if The_Queue.Head = null then
         The_Queue.Tail := null;
      end if;

      Free(Old_Head);
      
      The_Queue.Count := The_Queue.Count - 1;
   end Dequeue;

   function Front (The_Queue : in Queue) return Element_Type is
   begin
      if Is_Empty(The_Queue) then
         raise Queue_Error with "Tentativa de Front (peek) em fila vazia.";
      end if;

      return The_Queue.Head.Value;
   end Front;

   function Is_Empty (The_Queue : in Queue) return Boolean is
   begin
      return The_Queue.Head = null;
   end Is_Empty;
   
   function Length (The_Queue : in Queue) return Natural is
   begin
      return The_Queue.Count;
   end Length;

end Queues;
