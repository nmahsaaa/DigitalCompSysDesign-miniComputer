module memory(clk,command);
input clk;
reg [2:0] address ;
output reg [17:0] command ;

always @(posedge clk) begin 
 case(address)
	3'b000 : command = 18'b001111111111111111 ;
        3'b001 : command = 18'b001111111110101111 ;
        3'b010 : command = 18'b011111111110101011 ;
        3'b011 : command = 18'b010000000010101011 ;
        3'b100 : command = 18'b101010101010111011 ;
        3'b101 : command = 18'b101010101010111011 ;
        3'b110 : command = 18'b110000000100000010 ;
        3'b111 : command = 18'b110011010000001010 ;
 endcase
 address = (address + 1) % 8 ;
end
endmodule
