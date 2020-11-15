`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `INPUT(x,100),
   `OUTPUT(y,100)
   );

   `SIGNAL(acc, 100)
   `SIGNAL(acc_prev,100)
   `SIGNAL(acc_pprev,100)
   `SIGNAL(cnt,7)
   
   `ACC_ARE(clk, rst, 1'b0, en, acc, x)
   `COMB begin
      acc = acc_prev + acc_pprev+(cnt ==1'b1);
   end // UNMATCHED !!
     
   `REG_ARE(clk,rst,1'b0,cnt!=99,acc_pprev, acc_prev)
   `REG_ARE(clk,rst,1'b0,cnt!=99,acc_prev,acc)

   `COUNTER_ARE(clk,rst,cnt!=99,cnt)
   
   `SIGNAL2OUT(y, acc)
   
endmodule
