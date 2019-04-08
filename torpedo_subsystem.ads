package torpedo_subsystem with SPARK_Mode
is
   
   type TorpedoTube is record
      IsLoaded: Boolean;
      IsReadyToFire: Boolean;
   end record;
   
   subtype TorpedoIndex is Integer range 1 .. 20;
   
   type TorpedoTubes is array (TorpedoIndex) of TorpedoTube;
   
   type TubeIndices is array (TorpedoIndex) of Integer;
        
   type TorpedoSubsystem is record
      tubes: TorpedoTubes;
   end record;
      
   function GetLoadedTubes(Self: TorpedoSubsystem) return TubeIndices;
   
   function GetReadyTubes(Self: TorpedoSubsystem) return TubeIndices;
   
   procedure FireTorpedo(Self: in out TorpedoSubsystem; index: in Integer) with
     Pre => index in TorpedoIndex and then Self.tubes(index).IsReadyToFire = True,
     Post => Self.tubes(index).IsLoaded = False and Self.tubes(index).IsReadyToFire = False;

   procedure LoadTorpedo(Self: in out TorpedoSubsystem; index: in Integer) with
     Pre => index in TorpedoIndex and then Self.tubes(index).IsLoaded = False,
     Post => Self.tubes(index).IsLoaded = True;
     
end torpedo_subsystem;
