with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body People_Types is
   procedure Print_Details (Self : in Person) is
   begin
      Put_Line("Pessoa (Genérica) nascida em: " & Integer'Image(Self.Birth.Day) & "/" &
               Month_Name'Image(Self.Birth.Month) & "/" &
               Integer'Image(Self.Birth.Year));
   end Print_Details;

   overriding procedure Print_Details (Self : in Man) is
   begin
      Put_Line("Homem nascido em: " & Integer'Image(Self.Birth.Day) & "/" &
               Month_Name'Image(Self.Birth.Month) & "/" &
               Integer'Image(Self.Birth.Year));
      if Self.Has_Beard then
         Put_Line("Com barba");
      else
         Put_Line("Sem barba");
      end if;
   end Print_Details;

   overriding procedure Print_Details (Self : in Woman) is
   begin
      Put_Line("Mulher nascida em: " & Integer'Image(Self.Birth.Day) & "/" &
               Month_Name'Image(Self.Birth.Month) & "/" &
               Integer'Image(Self.Birth.Year));
      Put_Line("Amamentou " & Integer'Image(Self.Children_Breastfed) & " filhos");
   end Print_Details;

   procedure Analyze_Person (P : in Person'Class) is
   begin
      Put_Line("### Análise dos dados ###");
      Print_Details(P);
      Put_Line("--------------------------");
      New_Line;
   end Analyze_Person;

end People_Types;
