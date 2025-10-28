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
    
    for(i=0;i<depth;i=i+1)begin
      addr_a=i;
      data_a=i;
      #10;
    end
    
    #10;
    a=0;
    
    for(i=0;i<depth;i=i+1)begin
      addr_a=i;
      #10;
    end
    
   #10;
    b=1;
    
    for(i=0;i<depth;i=i+1)begin
      addr_b=i;
      data_b=i;
      #10;
    end
    
    #10;
    b=0;
    
    for(i=0;i<depth;i=i+1)begin
      addr_b=i;
      #10;
    end
    
    for (i =0;i<depth; i=i+1) begin
  $display("RAM[%0d]=%0d",i,dut.ram[i]);
    end
    #20; $finish;
  end
  
  initial begin
    $monitor("time = %0t, a = %b, addr_a = %0d, data_a = %0d, out_a = %0d,    b = %b, addr_b = %0d, data_b = %0d, out_b = %0d",$time, a, addr_a, data_a, out_a,     b, addr_b, data_b, out_b);
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end  
    
endmodule