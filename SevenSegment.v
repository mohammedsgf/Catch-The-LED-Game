module SevenSegment(
		input [3:0] digit,         // 4-bit input digit 
		output reg [6:0] sevenSeg //7-segment representation of digit 
	);

always @(digit)  						//Binary input to be displayed on 7-segment display in HEX form  
	  case (digit)
		4'b0000: sevenSeg = 7'b1000000; 	// 0
		4'b0001: sevenSeg = 7'b1111001; 	// 1
		4'b0010: sevenSeg = 7'b0100100; 	// 2
		4'b0011: sevenSeg = 7'b0110000; 	// 3
		4'b0100: sevenSeg = 7'b0011001;  // 4
		4'b0101: sevenSeg = 7'b0010010;  // 5
		4'b0110: sevenSeg = 7'b0000010;  // 6
		4'b0111: sevenSeg = 7'b1111000;  // 7
		4'b1000: sevenSeg = 7'b0000000; 	// 8
		4'b1001: sevenSeg = 7'b0010000;	// 9
		4'b1010: sevenSeg = 7'b0001000;	// A
		4'b1011: sevenSeg = 7'b0000011;	// B
		4'b1100: sevenSeg = 7'b1000110;	// C
		4'b1101: sevenSeg = 7'b0100001;	// D
		4'b1110: sevenSeg = 7'b0000110;	// E
		4'b1111: sevenSeg = 7'b0001110;	// F
		default: sevenSeg = 7'b1111111;  // Blank
	  endcase	
	
endmodule