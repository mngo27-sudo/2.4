/* top_60_tb.v
*      YOUR NAME
*      DATE
*      COURSE SECTION NUMBER
*/


`timescale 1ns/1ns
`define CLK_DIV 5

//Your module design must use the assignment API definition:
module top_60_tb (
    <YOUR CODE HERE>
    );


    //Simulation signals
    reg clk;
    reg pause = 1'b1;

    //Generate the clock waveform
    //   Set 10ns period and 50% duty cycle
    <YOUR CODE HERE>


    //Instantiate top_60 module
    //   Set CLK_DIV_INT to defined constant CLK_DIV
    //   Set clk and pause to this module's generated clk and pause signals.
    //   Generate low_digit, high_digit, muxed_digits, en_high_digit, en_low_digit.
    <YOUR CODE HERE>


    //Simulate 
    initial begin
       #100           //Enable timer
          pause = 1'b0;           
    end

endmodule
