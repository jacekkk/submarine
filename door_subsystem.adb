package body door_subsystem with SPARK_mode
is
   
   procedure Open_Door(Self: in out DoorSubsystem; index: Integer) is
   begin
      Self.doors(index).IsClosed := False;
   end Open_Door;
   
   procedure Close_Door(Self: in out DoorSubsystem; index: Integer) is
   begin
      Self.doors(index).IsClosed := True;
   end Close_Door;
   
   procedure Unlock_Door(Self: in out DoorSubsystem; index: Integer) is
   begin
      Self.doors(index).IsLocked := False;
   end Unlock_Door;
   
   procedure Lock_Door(Self: in out DoorSubsystem; index: Integer) is
   begin
      Self.doors(index).IsLocked := True;
   end Lock_Door;
   
   function AreAllClosedAndLocked(Self: DoorSubsystem) return Boolean is
   begin
      for index in Self.doors'Range loop
         if Self.doors(index).IsClosed = False or Self.doors(index).IsLocked = False then
            return False;
         end if;
      end loop;
      return True;
   end AreAllClosedAndLocked;
      
end door_subsystem;
