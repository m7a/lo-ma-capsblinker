with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Command_Line;

with Termination_Status;

procedure Ma_Capsblinker is

	Input_Loc: constant String := "/sys/class/leds";

	procedure Help is
	begin
		Put_Line("Ma_Sys.ma Capsblinker 2.0.0, " &
					"Copyright (c) 2018 Ma_Sys.ma.");
		Put_Line("For further info send an e-mail to " &
					"Ma_Sys.ma@web.de.");
		Put_Line("USAGE $0 [LED name]");
		Put_Line("See " & Input_Loc & " e.g. input0::capslock");
	end Help;

	procedure Write_File(File, Content: in String) is
		Descriptor: File_Type;
	begin
		Open(Descriptor, Out_File, File);
		Put(Descriptor, Content);
		Close(Descriptor);
	end Write_File;

	procedure Run(Led_Name: in String) is
		File: constant String := Input_Loc & "/" & Led_Name &
								"/brightness";
	begin
		while Termination_Status.Is_Online loop
			Write_File(File, "1");
			delay 0.15;
			Write_File(File, "0");
			delay 0.85;
		end loop;
	end Run;

begin

	if Ada.Command_Line.Argument_Count = 0 then
		Help;
		-- no parameters is considered an error
		Ada.Command_Line.Set_Exit_Status(1);
	else
		declare
			Arg0: constant String := Ada.Command_Line.Argument(1);
		begin
			if Arg0 = "--help" then
				Help;
			else
				Run(Arg0);
			end if;
		end;
	end if;

end Ma_Capsblinker;
