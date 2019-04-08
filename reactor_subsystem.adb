package body reactor_subsystem with SPARK_Mode
is

   function GetReactorTemperature(Self: ReactorSubsystem) return Integer is
   begin
      return Self.temperature;
   end GetReactorTemperature;
      
   function IsTemperatureSafe(Self: ReactorSubsystem) return Boolean is
      temperature : Integer;
   begin
      temperature := GetReactorTemperature(Self);
      if temperature in SafeReactorTemperature then
         return True;
      else
         return False;
      end if;
   end IsTemperatureSafe;
   
   procedure SetReactorTemperature (Self: out ReactorSubsystem; temp: in Integer) is
   begin
      Self.temperature := temp;
   end SetReactorTemperature; 

end reactor_subsystem;
