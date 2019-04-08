package reactor_subsystem with SPARK_Mode
is
   
   subtype SafeReactorTemperature is Integer range 0 .. 300;
   
   type ReactorSubsystem is record
      temperature: Integer;
   end record;

   function GetReactorTemperature(Self: ReactorSubsystem) return Integer;
   
   function IsTemperatureSafe(Self: ReactorSubsystem) return Boolean;
   
   procedure SetReactorTemperature(Self: out ReactorSubsystem; temp: in Integer) with
     Pre => temp in SafeReactorTemperature,
     Post => Self.temperature in SafeReactorTemperature and Self.temperature = temp;   
     
end reactor_subsystem;
