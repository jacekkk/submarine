with Ada.Text_IO; use Ada.Text_IO;

with door_subsystem; use door_subsystem;
with navigation_subsystem; use navigation_subsystem;
with oxygen_subsystem; use oxygen_subsystem;
with reactor_subsystem; use reactor_subsystem;
with torpedo_subsystem; use torpedo_subsystem;

package submarine_system with SPARK_Mode
is
   
   type SubmarineSystem is record
      DoorSystem: DoorSubsystem;
      NavigationSystem : NavigationSubsystem;
      OxygenSystem : OxygenSubsystem;
      ReactorSystem: ReactorSubsystem;
      TorpedoSystem : TorpedoSubsystem;
   end record;
   
   submarine : SubmarineSystem := 
     (DoorSystem => (doors => (others => (IsClosed => False, IsLocked => False))),
      NavigationSystem => (currentDepth => 0),
      OxygenSystem => (level => 50, status => Stable),
      ReactorSystem => (temperature => 200),
      TorpedoSystem => (tubes => (others => (IsLoaded => False, IsReadyToFire => False))));
   
   function CanOperate return Boolean;
   
   procedure ResurfaceIfCriticalOxygenOrReactorOverheats with
     Pre => CanOperate = True and submarine.NavigationSystem.currentDepth > 0 and
     (oxygen_subsystem.GetOxygenStatus(submarine.OxygenSystem) = Critical or 
          reactor_subsystem.IsTemperatureSafe(submarine.ReactorSystem) = False),
     Post => submarine.NavigationSystem.currentDepth = 0;
   
   pragma Warnings (Off);
   procedure WarnIfLowOxygen;
   
end submarine_system;
