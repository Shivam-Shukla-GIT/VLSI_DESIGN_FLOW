module fsm_opt (
 input clk,             //Clock signal
 input reset,           //Reset signal
 input [1:0] in,        //2-bit input signal
 output reg [1:0] out   //2-bit output signal
);

//States
parameter S1 = 5'b00001;
parameter S2 = 5'b00010;
parameter S3 = 5'b00100;
parameter S4 = 5'b01000;
parameter S5 = 5'b10000;

//State reg and next state reg
reg [4:0] state_reg, next_reg;

//State transition
always @(posedge clk or posedge reset) begin
 if (reset) begin
 state_reg <= S1;  //Reset to initial state S1
 end else begin
 state_reg <= next_reg;  //Transition to next state
 end
 end

always @(*) begin
 //Default values
 next_reg=state_reg;
 out=2'b00;

 //Switch cases for states and outputs
 case (state_reg)
 S1: begin
 case (in)
 2'b00: begin
 out=2'b01;
 next_reg=S1;
 end
 2'b01: begin
 out=2'b00;
 next_reg=S1;
 end
 2'b10: begin
 out=2'b01;
 next_reg=S2;
 end
 2'b11: begin
 out=2'b00;
 next_reg=S3;
 end
 endcase
 end
 S2: begin
 case (in)
 2'b00: begin
 out=2'b11;
 next_reg=S1;
 end
 2'b01: begin
 out=2'b11;
 next_reg=S3;
 end
 2'b10: begin
 out=2'b10;
 next_reg=S2;
 end
 2'b11: begin
 out=2'b10;
 next_reg=S4;
 end
 endcase
 end
 S3: begin
 case (in)
 2'b00: begin
 out=2'b00;
 next_reg=S1;
 end
 2'b01: begin
 out=2'b01;
 next_reg=S5;
 end
 2'b10: begin
 out=2'b00;
 next_reg=S3;
 end
 2'b11: begin
 out=2'b00;
 next_reg=S4;
 end
 endcase
 end
 S4: begin
 case (in)
 2'b00: begin
 out=2'b11;
 next_reg=S3;
 end
 2'b01: begin
 out=2'b01;
 next_reg=S5;
 end
 2'b10: begin
 out=2'b01;
 next_reg=S5;
 end
 2'b11: begin
 out=2'b11;
 next_reg=S4;
 end
 endcase
 end
 S5: begin
 case (in)
 2'b00: begin
 out=2'b00;
 next_reg=S5;
 end
 2'b01: begin
 out=2'b00;
 next_reg=S1;
 end
 2'b10: begin
 out=2'b10;
 next_reg=S1;
 end
 2'b11: begin
 out=2'b11;
 next_reg=S5;
 end
 endcase
 end
 endcase
end
endmodule