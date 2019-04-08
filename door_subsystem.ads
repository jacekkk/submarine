package door_subsystem with SPARK_Mode
is
   
   type AirlockDoor is record
      IsClosed: Boolean;
      IsLocked: Boolean;
   end record;
   
   subtype DoorIndex is Integer range 0 .. 1;
      
   type AirlockDoors is array (DoorIndex) of AirlockDoor;
   
   type DoorSubsystem is record
      doors: AirlockDoors;
   end record;
      
   procedure Open_Door(Self: in out DoorSubsystem; index: Integer) with
     Pre => index in DoorIndex and then (Self.doors(0).IsClosed = True and Self.doors(1).IsClosed = True),
     Post => Self.doors(0).IsClosed = True or Self.doors(1).IsClosed = True;
         
   procedure Close_Door(Self: in out DoorSubsystem; index: Integer) with
     Pre => index in DoorIndex and then Self.doors(index).IsClosed = False,
     Post => Self.doors(index).IsClosed = True;
   
   procedure Unlock_Door(Self: in out DoorSubsystem; index: Integer) with
     Pre => index in DoorIndex and then Self.doors(index).IsLocked = True,
     Post => Self.doors(index).IsLocked = False;
   
   procedure Lock_Door(Self: in out DoorSubsystem; index: Integer) with
     Pre => index in DoorIndex and then Self.doors(index).IsLocked = False,
     Post => Self.doors(index).IsLocked = True;
   
   function AreAllClosedAndLocked(Self: DoorSubsystem) return Boolean;
   
end door_subsystem;
