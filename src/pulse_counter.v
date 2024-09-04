// Gray counter

module PULSE
(
	input clk, enable, reset, 
	input [7:0] pulse,
	output reg [7:0] gray_count
);

reg [7:0] out_gray;
reg [3:0] pulse_count ;

GREY_COUNT gray
	(
		.clk (clk), 
		.enable (enable), 
		.reset (reset),
		.gray_count (out_gray)
	);

	

	always @ (posedge reset or posedge clk)
	begin
		if (reset) begin
			pulse_count <= 0;
		end
		else if (enable)
		begin
			pulse_count <= pulse_count + pulse ;
			if (pulse_count == 4) begin
				gray_count <= out_gray;
			end
			else begin 
				gray_count <= 0;
			end
		end
	end

endmodule
