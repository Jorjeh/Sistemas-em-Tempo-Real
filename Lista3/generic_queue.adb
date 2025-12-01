package body Generic_Queue is
   procedure Initialize(Q : out Queue) is
   begin
      Q.Front := 1;
      Q.Rear  := 0;
      Q.Size  := 0;
   end Initialize;

   procedure Enqueue(Q : in out Queue; X : Item_Type) is
   begin
      if Is_Full(Q) then
         raise Constraint_Error with "Queue is full";
      end if;
      Q.Rear := (Q.Rear mod Capacity) + 1;
      Q.Data(Q.Rear) := X;
      Q.Size := Q.Size + 1;
   end Enqueue;

   procedure Dequeue(Q : in out Queue; X : out Item_Type) is
   begin
      if Is_Empty(Q) then
         raise Constraint_Error with "Queue is empty";
      end if;
      X := Q.Data(Q.Front);
      Q.Front := (Q.Front mod Capacity) + 1;
      Q.Size := Q.Size - 1;
   end Dequeue;

   function Is_Empty(Q : Queue) return Boolean is
   begin
      return Q.Size = 0;
   end Is_Empty;

   function Is_Full(Q : Queue) return Boolean is
   begin
      return Q.Size = Capacity;
   end Is_Full;

end Generic_Queue;
