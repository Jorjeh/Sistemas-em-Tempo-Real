generic
   type Element_Type is private;
package Queues is

   Queue_Error : exception;
   type Queue is limited private;

   procedure Initialize (The_Queue : out Queue);

   procedure Enqueue (The_Queue : in out Queue; Item : in Element_Type);

   procedure Dequeue (The_Queue : in out Queue; Item : out Element_Type);

   function Front (The_Queue : in Queue) return Element_Type;

   function Is_Empty (The_Queue : in Queue) return Boolean;
   
   function Length (The_Queue : in Queue) return Natural;

private
   type Node;
   type Node_Access is access Node;

   type Node is record
      Value : Element_Type;
      Next  : Node_Access;
   end record;

   type Queue is record
      Head  : Node_Access;
      Tail  : Node_Access;
      Count : Natural := 0; 
   end record;

end Queues;
