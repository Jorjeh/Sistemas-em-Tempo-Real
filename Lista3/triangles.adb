with Objects; use Objects;

package body Triangles is
   overriding function Area(T : Triangle) return Float is
   begin
      return 0.5 * T.Base * T.Height;
   end Area;
end Triangles;
