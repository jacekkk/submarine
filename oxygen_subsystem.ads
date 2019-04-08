package oxygen_subsystem with SPARK_Mode
is
   
   subtype OxygenLevel is Integer range 0 .. 100;
   subtype StableLevel is OxygenLevel range 50 .. 100;
   subtype LowLevel is OxygenLevel range 20 .. 49;
   subtype CriticalLevel is OxygenLevel range 0 .. 19;
   
   type OxygenStatus is (Stable, Low, Critical);
   
   type OxygenSubsystem is record
      level: OxygenLevel;
      status: OxygenStatus;
   end record;
      
   function GetOxygenLevel(Self: OxygenSubsystem) return OxygenLevel;
   
   function GetOxygenStatus(Self: OxygenSubsystem) return OxygenStatus;
   
   procedure SetOxygenLevel(Self: in out OxygenSubsystem; level: in Integer) with
     Pre => level in OxygenLevel,
     Post => Self.level in OxygenLevel and Self.level = level;
   
   procedure UpdateOxygenStatus(Self: in out OxygenSubsystem) with
     Post => Self.status in OxygenStatus;
     
end oxygen_subsystem;
