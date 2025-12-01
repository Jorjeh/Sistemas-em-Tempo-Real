generic
   type Item_Type is private;    
   Capacity : Positive;          
package Generic_Queue is

   type Queue_Array is array (1 .. Capacity) of Item_Type;

   type Queue is record
      Data  : Queue_Array;       
      Front : Integer := 1;      
      Rear  : Integer := 0;      
      Size  : Integer := 0;      
   end record;

   procedure Initialize(Q : out Queue);

   procedure Enqueue(Q : in out Queue; X : Item_Type);

   procedure Dequeue(Q : in out Queue; X : out Item_Type);

   function Is_Empty(Q : Queue) return Boolean;

   function Is_Full(Q : Queue) return Boolean;

end Generic_Queue;
