with Objects; use Objects;

package Rectangles is
   type Rectangle is new Object with record
      Width  : Float;
      Height : Float;
   end record;

   overriding function Area(R : Rectangle) return Float;
end Rectangles;
