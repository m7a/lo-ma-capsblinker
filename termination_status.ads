with Ada.Interrupts;
with Ada.Interrupts.Names;

package Termination_Status is

	protected Handler is
		procedure Handle_Int;
		-- Register handler for CTRL-C as per
		-- https://rosettacode.org/wiki/Handle_a_signal#Ada
		-- https://www.pegasoft.ca/resources/boblap/14.html
		pragma Unreserve_All_Interrupts;
		pragma Interrupt_Handler(Handle_Int);
		pragma Attach_Handler(Handle_Int, Ada.Interrupts.Names.Sigint);
		pragma Attach_Handler(Handle_Int, Ada.Interrupts.Names.Sigterm);
	end Handler;

	function Is_Online return Boolean;

private

	Online: Boolean := True;

end Termination_Status;
