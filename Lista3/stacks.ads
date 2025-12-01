package Stacks is

   type Element_Type is new Integer;  
   type Stack is private;

   Underflow : exception;
   Overflow : exception;

   procedure Push(S : in out Stack; Item : in Element_Type);
   procedure Pop(S : in out Stack);
   function Top(S : in Stack) return Element_Type;
   function Is_Empty(S : in Stack) return Boolean;

private
   Max_Size : constant := 100;
   type Element_Array is array (1 .. Max_Size) of Element_Type;

   type Stack is record
      Elements : Element_Array;
      Top_Index : Natural := 0;
   end record;

end Stacks;
