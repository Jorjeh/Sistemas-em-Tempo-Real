with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure q7 is

   type Month_Name is (Jan, Fev, Mar, Abr, Mai, Jun,
                       Jul, Aug, Set, Oct, Nov, Dez);
   type Date is
      record
         Day   : Integer range 1 .. 31;
         Month : Month_Name;
         Year  : Integer;
      end record;

   type Person is tagged
      record
         Birth : Date;
      end record;

   -- Homen
   type Man is new Person with
      record
         Has_Beard : Boolean;
      end record;

   -- Mulher
   type Woman is new Person with
      record
         Children_Breastfed : Integer range 0 .. 10;
      end record;

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
         when 3  => return Mai;
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
            Put_Line("Mês inválido!!");
            return Jan;
      end case;
   end Int_To_Month;

begin
   -- Entrada do Homem
   Put_Line("Informe dados masculino:");
   Put("Dia de nascimento: "); Get(Input_Int); M1.Birth.Day := Input_Int;
   Put("Mês (1 = Jan, 2 = Fev, ..., 12 = Dez): "); Get(Input_Int); M1.Birth.Month := Int_To_Month(Input_Int);
   Put("Ano de nascimento: "); Get(Input_Int); M1.Birth.Year := Input_Int;
   Put("Tem barba? (0 = não, 1 = sim): "); Get(Input_Int); M1.Has_Beard := Int_To_Bool(Input_Int);

   New_Line;

   -- Entrada da Mulher
   Put_Line("Informe dados feminino:");
   Put("Informe dia de nascimento: "); Get(Input_Int); W1.Birth.Day := Input_Int;
   Put("Mês (1 = Jan, 2 = Fev, ..., 12 = Dez): "); Get(Input_Int); W1.Birth.Month := Int_To_Month(Input_Int);
   Put("Informe Ano de nascimento: "); Get(Input_Int); W1.Birth.Year := Input_Int;
   Put("Quantos filhos amamentados: "); Get(W1.Children_Breastfed);

   New_Line;

   -- Saída
   Put_Line("Homem nascido em: " & Integer'Image(M1.Birth.Day) & "/" &
            Month_Name'Image(M1.Birth.Month) & "/" &
            Integer'Image(M1.Birth.Year));
   if M1.Has_Beard then
      Put_Line("Com barba");
   else
      Put_Line("Sem barba");
   end if;

   Put_Line("Mulher nascida em: " & Integer'Image(W1.Birth.Day) & "/" &
            Month_Name'Image(W1.Birth.Month) & "/" &
            Integer'Image(W1.Birth.Year));
   Put_Line("Amamentou " & Integer'Image(W1.Children_Breastfed) & " filhos");

end q7;
