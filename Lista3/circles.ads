with Objects; use Objects;

package Circles is
   type Circle is new Object with
      record
         Radius : Float;
      end record;

   overriding function Area(C : Circle) return Float;
end Circles;
