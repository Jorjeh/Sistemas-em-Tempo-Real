with Objects; use Objects;

package body Circles is

   Pi : constant Float := 3.14159265358979323846;

   overriding function Area(C : Circle) return Float is
   begin
      return Pi * C.Radius ** 2;
   end Area;

end Circles;
