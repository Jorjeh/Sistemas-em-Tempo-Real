with Objects; use Objects;

package Triangles is
   type Triangle is new Object with record
      Base   : Float;
      Height : Float;
   end record;

   overriding function Area(T : Triangle) return Float;
end Triangles;
