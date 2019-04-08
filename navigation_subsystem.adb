package body navigation_subsystem with SPARK_Mode
is
   
   function GetDepth(Self : NavigationSubsystem) return Integer is
   begin
      return Self.currentDepth;
   end GetDepth;
   
   procedure SetDepth (Self : out NavigationSubsystem; depth: in Integer) is
   begin
      Self.currentDepth := depth;
   end SetDepth;
   
   procedure Descend(Self : in out NavigationSubsystem) is
   begin
      while Self.currentDepth < MAX_DEPTH loop
         Self.currentDepth := Self.currentDepth + 1;
      end loop;
   end Descend;
   
   procedure Ascend(Self : in out NavigationSubsystem) is
   begin
      while Self.currentDepth > MIN_DEPTH loop
         Self.currentDepth := Self.currentDepth - 1;
      end loop;
   end Ascend;
      
end navigation_subsystem;
