package body Generic_Stacks is

   procedure Push(S : in out Stack; Item : in Element_Type) is
   begin
      if S.Top_Index >= Max_Size then
         raise Constraint_Error;  -- Overflow
      end if;
      S.Top_Index := S.Top_Index + 1;
      S.Elements(S.Top_Index) := Item;
   end Push;

   procedure Pop(S : in out Stack) is
   begin
      if S.Top_Index = 0 then
         raise Underflow;
      end if;
      S.Top_Index := S.Top_Index - 1;
   end Pop;

   function Top(S : in Stack) return Element_Type is
   begin
      if S.Top_Index = 0 then
         raise Underflow;
      end if;
      return S.Elements(S.Top_Index);
   end Top;

   function Is_Empty(S : in Stack) return Boolean is
   begin
      return S.Top_Index = 0;
   end Is_Empty;

end Generic_Stacks;
