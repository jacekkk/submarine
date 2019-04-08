package body submarine_system with SPARK_Mode
is
   
   function CanOperate return Boolean is
   begin
      return door_subsystem.AreAllClosedAndLocked(submarine.DoorSystem);
   end CanOperate;
   
   procedure ResurfaceIfCriticalOxygenOrReactorOverheats is
   begin
      navigation_subsystem.Ascend(submarine.NavigationSystem);
   end ResurfaceIfCriticalOxygenOrReactorOverheats; 
   
   pragma Warnings (Off);
   procedure WarnIfLowOxygen is
   begin
      if oxygen_subsystem.GetOxygenStatus(submarine.OxygenSystem) = Low then
         Put_Line("Warning: Low oxygen level. Must resurface soon.");
      end if;
   end WarnIfLowOxygen;
    
end submarine_system;
