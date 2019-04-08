package navigation_subsystem with SPARK_Mode
is

   MIN_DEPTH : constant Integer := 0;
   MAX_DEPTH : constant Integer := 300;
   
   type NavigationSubsystem is record
      currentDepth: Integer;
   end record;
      
   function GetDepth(Self : NavigationSubsystem) return Integer;
   
   procedure SetDepth(Self : out NavigationSubsystem; depth: in Integer) with
     Pre => depth >= MIN_DEPTH and depth <= MAX_DEPTH,
     Post => Self.currentDepth = depth;
 
   procedure Descend(Self : in out NavigationSubsystem) with
     Pre => Self.currentDepth < MAX_DEPTH,
     Post => Self.currentDepth > Self.currentDepth'Old and Self.currentDepth = MAX_DEPTH;
   
   procedure Ascend(Self : in out NavigationSubsystem) with
     Pre => Self.currentDepth > MIN_DEPTH,
     Post => Self.currentDepth < Self.currentDepth'Old and Self.currentDepth = MIN_DEPTH;

end navigation_subsystem;
