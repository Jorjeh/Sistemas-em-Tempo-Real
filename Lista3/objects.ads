with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package Objects is
   type Object is abstract tagged null record;

   -- Função dispatching abstrata
   function Area(O : Object) return Float is abstract;
end Objects;
