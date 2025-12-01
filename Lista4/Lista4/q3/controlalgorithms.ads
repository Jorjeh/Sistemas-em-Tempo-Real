with DataTypes; use DataTypes;

package ControlAlgorithms is
   -- Procedimentos para gerar valores de setpoint baseados nos valores medidos
   procedure Calculate_Heating_Setpoint(TV : in TemperatureValue;
                                        HP : out HeatingPosition);
   procedure Calculate_Valve_Setpoint(PV : in PressureValue;
                                      VP : out ValvePosition);
end ControlAlgorithms;