module fsm_opt_tb;
 reg clk;
 reg reset;
 reg [1:0] in;
 wire [1:0] out;
 
 //Instantiate our verilog top level fsm
 fsm_opt dut(
 .clk(clk),
 .reset(reset),
 .in(in),
 .out(out)
 );
 
 //Generating clk
 initial 
 begin
 clk=0;
 forever #10 clk = ~clk;    //To toggle it always
 end
 
 //Tests
 initial 
 begin
 
 $dumpfile("fsm_opt.vcd");      //Dumpfile
 $dumpvars(0,fsm_opt_tb);
 
 //Defining reset and in
 reset = 1; in = 2'b00;
 #20 reset = 0;
 
 //All possible paths are tested by input combinations
 #20 in=2'b00; //S1
 #20 in=2'b01; //S1
 #20 in=2'b10; //S2
 #20 in=2'b10; //S2
 #20 in=2'b01; //S3
 #20 in=2'b10; //S3
 #20 in=2'b11; //S4
 #20 in=2'b11; //S4
 #20 in=2'b10; //S5
 #20 in=2'b00; //S5
 #20 in=2'b11; //S5
 #20 in=2'b01; //S1
 
 reset=1;
 #0.5 reset=0;
 
 #20 in=2'b11; //S3
 #20 in=2'b00; //S1
 #20 in=2'b11; //S3
 #20 in=2'b01; //S5
 #20 in=2'b10; //S1
 
 reset=1;
 #0.5 reset=0;
 
 #20 in=2'b10; //S2
 #20 in=2'b00; //S1
 #20 in=2'b11; //S3
 #20 in=2'b01; //S5
 #20 in=2'b01; //S1
 
 reset=1;
 #0.5 reset=0;
 
 #20 in=2'b10; //S2
 #20 in=2'b10; //S2
 #20 in=2'b11; //S4
 #20 in=2'b00; //S3
 #20 in=2'b11; //S4
 #20 in=2'b01; //S5
 #20 in=2'b10; //S1
 
 reset=1;
 #0.5 reset=0;
 
 #20 in=2'b10;
 #20 in=2'b10;
 #20 in=2'b01;
 #20 in=2'b00;
 #20 in=2'b01;
 #20 in=2'b11;
 #20 in=2'b11;
 #20 in=2'b00;
 #20 in=2'b01;
 #20 in=2'b00;
 #20 in=2'b01;

 //End simulation
 #10 $finish;
 end
 
 //signal verification
 always @(posedge clk or posedge reset) begin
 if (reset) begin
 end else begin
 end
 end
endmodule