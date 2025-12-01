
package DataTypes is
   -- Definições de tipos necessários
   type TemperatureValue is new Integer range 10..500;
   type PressureValue is new Integer range 0..750;
   type HeatingPosition is (On, Off);
   type ValvePosition is new Integer range 0..9;
end DataTypes;