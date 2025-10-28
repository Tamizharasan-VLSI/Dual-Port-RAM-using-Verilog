`timescale 1ns / 1ps

module dual_port_ram#(parameter data_width = 8,
                      parameter addr_width = 6)
  (input clk,rst,
    input [data_width-1:0]data_a,
   input [data_width-1:0]data_b,
   input [addr_width-1:0]addr_a,
   input [addr_width-1:0]addr_b,
  input a,b,
   output reg[data_width-1:0] out_a,
   output reg [data_width-1:0] out_b);
  
    localparam depth = 2**addr_width;
  reg [data_width-1:0] ram [depth-1:0];
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      out_a <= 8'bx;
      out_b <= 8'bx;
    end
    
    else begin
      if(a)begin
        ram[addr_a] <= data_a;
      end
        else begin
          out_a <= ram[addr_a];
        end
    end
  end
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      out_a <= 8'bx;
      out_b <= 8'bx;
    end
    
    else begin
      if(b)begin
        ram[addr_b] <= data_b;
      end
        else begin
          out_b <= ram[addr_b];
        end
    end
  end
endmodule

