package body torpedo_subsystem with SPARK_Mode
is
   
   function GetLoadedTubes(Self: TorpedoSubsystem) return TubeIndices is
      loadedTubes : TubeIndices;
   begin
      loadedTubes := (others => -1);
      for index in Self.tubes'Range loop
         if Self.tubes(index).IsLoaded = True then
            loadedTubes(index) := index;
         end if;
      end loop;
      return loadedTubes;
   end GetLoadedTubes;
   
   function GetReadyTubes(Self: TorpedoSubsystem) return TubeIndices is
      readyTubes : TubeIndices;
   begin
      readyTubes := (others => -1);
      for index in Self.tubes'Range loop
         if Self.tubes(index).IsReadyToFire = True then
            readyTubes(index) := index;
         end if;
      end loop;
      return readyTubes;
   end GetReadyTubes;
   
   procedure FireTorpedo(Self: in out TorpedoSubsystem; index: in Integer) is
   begin
      Self.tubes(index).IsLoaded := False;
      Self.tubes(index).IsReadyToFire := False;
   end FireTorpedo;
   
   procedure LoadTorpedo(Self: in out TorpedoSubsystem; index: in Integer) is
   begin
      Self.tubes(index).IsLoaded := True;
   end LoadTorpedo;
     
end torpedo_subsystem;
