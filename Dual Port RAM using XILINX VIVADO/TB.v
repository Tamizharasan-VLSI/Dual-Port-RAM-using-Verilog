`timescale 1ns / 1ps

module tb;
  parameter data_width = 8;
  parameter addr_width = 6;
  reg clk,rst;
  reg [data_width-1:0]data_a;
  reg [data_width-1:0]data_b;
  reg [addr_width-1:0]addr_a;
  reg [addr_width-1:0]addr_b;
  reg a,b;
  wire [data_width-1:0] out_a;
  wire [data_width-1:0] out_b;
  localparam depth = 2**addr_width;;
  integer i;
  
  dual_port_ram dut (clk,rst,data_a,data_b,addr_a,addr_b,a,b,out_a,out_b);
  
  always #5 clk=~clk;
  
  initial begin
    clk =1;
    rst=1;
    data_a=1'bx;
    data_b=1'bx;
    addr_a=1'bx;
    addr_b=1'bx;
    a=1'bx;
    b=1'bx;
    
  #10;
   a=1;
   rst=0;
    
    for(i=0;i<32;i=i+1)begin
      addr_a=i;
      data_a=i;
      #10;
    end
    
    #10;
    a=0;
    
    for(i=0;i<32;i=i+1)begin
      addr_a=i;
      #10;
    end
    
   #10;
    b=1;
    
    for(i=32;i<64;i=i+1)begin
      addr_b=i;
      data_b=i;
      #10;
    end
    
	#10;
    b=0;
    
	for(i=32;i<64;i=i+1)begin
      addr_b=i;
      #10;
    end
    
	#10; $finish;
  end    
endmodule




