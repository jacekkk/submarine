package body oxygen_subsystem with SPARK_Mode
is
   
   function GetOxygenLevel(Self: OxygenSubsystem) return OxygenLevel is
   begin
      return Self.level;
   end GetOxygenLevel;
   
   function GetOxygenStatus(Self: OxygenSubsystem) return OxygenStatus is
   begin
      return Self.status;
   end GetOxygenStatus;
  
   procedure SetOxygenLevel (Self: in out OxygenSubsystem; level: in Integer) is
   begin
      Self.level := level;
   end SetOxygenLevel;
   
   procedure UpdateOxygenStatus(Self: in out OxygenSubsystem) is
      level : OxygenLevel;
   begin
      level := GetOxygenLevel(Self);
      case level is
      when StableLevel => 
         if Self.status /= Stable then
            Self.status := Stable;
         end if;
      when LowLevel => 
         if Self.status /= Low then
            Self.status := Low;
         end if;
      when CriticalLevel =>
         if Self.status /= Critical then
            Self.status := Critical;
         end if;
      end case;
   end UpdateOxygenStatus;
   
end oxygen_subsystem;
