package body Termination_Status is

	protected body Handler is
		procedure Handle_Int is
		begin
			Online := False;
		end Handle_Int;
	end Handler;

	function Is_Online return Boolean is (Online);

end Termination_Status;
