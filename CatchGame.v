module CatchGame(
input Clk_50MHz,
input button,
input reset,
input [9:0] SW,
output  [9:0] LED,
output [6:0] Hex0
);


reg [3:0] Point=0;//point calc
wire clk_1Hz;
reg Dire=0;//1 right    0 left

reg [9:0] led=10'b0000000001;//led reg
reg isL=0;//Losing signal
assign LED=led;
wire [6:0]sevenSeg;
assign Hex0={1'b0,sevenSeg};

Clock_divider(Clk_50MHz,clk_1Hz,~reset);//clock divder
SevenSegment(Point,sevenSeg);//seven segmant

always @(posedge clk_1Hz, negedge reset)
begin
	
	if(~reset)//reset
	begin
		led=10'b0000000001;
		Dire=0;
	end// end reset
	else//else 
	begin
		if(Dire==1)//Dire
		begin
			led=led>>1;
			if(led[0]==1)
				Dire=0;
		end//end Dire	
		else if(isL==1)
			led=10'b1111111111;
		else//else
		begin
			led=led<<1;
			if(led[9]==1)
				Dire=1;
		end//end else
		
	end//end else
end//end always

always@(negedge button,negedge reset)
begin

	if(~reset)
	begin
		Point<=0;
		isL<=0;
	end
	else
		if(~button)
			if(SW==led)
				Point<=Point+1;
			else
			begin
				isL<=1;
				Point<=0;
			end
		
		

end



endmodule 