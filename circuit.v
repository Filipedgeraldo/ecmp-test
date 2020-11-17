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
   `SIGNAL(cnt,7)
   
   `ACC_ARE(clk, rst, 1'b0, en, acc, x)
   `COMB begin
     // acc_ale=x;
      acc = 2* acc_prev +x;
//acc_ale;
   end // UNMATCHED !!
     
   `REG_ARE(clk,rst,1'b0,cnt!=99,acc_prev,acc)
  // `REG_ARE(clk,rst,1'b0,cnt!=99,acc_ale,acc)

   `COUNTER_ARE(clk,rst,cnt!=99,cnt)
   
   `SIGNAL2OUT(y, acc)
   
endmodule
