with Objects; use Objects;

package body Rectangles is
   overriding function Area(R : Rectangle) return Float is
   begin
      return R.Width * R.Height;
   end Area;
end Rectangles;
