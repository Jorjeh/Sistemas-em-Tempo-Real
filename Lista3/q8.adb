with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with People_Types; use People_Types;

procedure q8 is
   M1 : Man;
   W1 : Woman;
   Input_Int : Integer;

   -- inteiro -> Boolean
   function Int_To_Bool(I : Integer) return Boolean is
   begin
      return I /= 0;
   end Int_To_Bool;

   -- inteiro -> Month_Name
   function Int_To_Month(I : Integer) return Month_Name is
   begin
      case I is
         when 1  => return Jan;
         when 2  => return Fev;
         when 3  => return Mar;
         when 4  => return Abr;
         when 5  => return Mai;
         when 6  => return Jun;
         when 7  => return Jul;
         when 8  => return Aug;
         when 9  => return Set;
         when 10  => return Oct;
         when 11 => return Nov;
         when 12 => return Dez;
         when others =>
            Put_Line("Mês inválido!");
            return Jan;
      end case;
   end Int_To_Month;

begin
   -- Entrada do Homem
   Put_Line("Dados masculino:");
   Put("Dia de nascimento: "); Get(Input_Int); M1.Birth.Day := Input_Int;
   Put("Mês (1 = Jan, 2 = Fev, ..., 12 = Dez): "); Get(Input_Int); M1.Birth.Month := Int_To_Month(Input_Int);
   Put("Ano de nascimento: "); Get(Input_Int); M1.Birth.Year := Input_Int;
   Put("Com barba? (0 = não, 1 = sim): "); Get(Input_Int);
   M1.Has_Beard := Int_To_Bool(Input_Int);

   New_Line;

   -- Entrada da Mulher
   Put_Line("Dadsos feminino:");
   Put("Dia de nascimento: "); Get(Input_Int);
   W1.Birth.Day := Input_Int;
   Put("Mês (1 = Jan, 2 = Fev, ..., 12 = Dez): "); Get(Input_Int); W1.Birth.Month := Int_To_Month(Input_Int);
   Put("Ano de nascimento: "); Get(Input_Int);
   W1.Birth.Year := Input_Int;
   Put("Número de amamentados: "); Get(W1.Children_Breastfed);

   New_Line;

   Analyze_Person(M1);
   Analyze_Person(W1);

end q8;
