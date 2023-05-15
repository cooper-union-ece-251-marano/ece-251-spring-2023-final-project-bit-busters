////////////////////////////////////////////////////////////////////////////////
//      
//      Module: module_name 
//      Hdl: Verilog
//
//      Module Description: 
//
//      Author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module clock
    #(parameter ticks = 10)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input ENABLE,
    output reg CLOCK
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    reg start_clock;
    real clock_on = ticks/2; // duty cycle = 50%
    real clock_off = ticks/2;

    // initialize variables
    initial begin
      CLOCK <= 0;
      start_clock <= 0;
    end

    always @(posedge ENABLE or negedge ENABLE) begin
        if (ENABLE) begin
            start_clock = 1;
        end
        else begin
            start_clock = 0;
        end
        // #ticks CLOCK = ~CLOCK;
    end
    always @(start_clock) begin
        CLOCK = 0;
        while (start_clock) begin
            #(clock_off) CLOCK = 1;
            #(clock_on) CLOCK = 0;
        end
        CLOCK = 0;
    end
endmodule


