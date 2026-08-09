/* timer_60.v
 * Generate the count sequence 00-59 then repeat.
 * Assemble from 2 counter_nbit blocks,
 * 4-bits for the low digit (ones digit)
 * and 3 bits for the high digit (tens digit).
 */

module timer_60(
    input clk,
    input enable,
    output [3:0] low_digit,
    output [2:0] high_digit
);

    // Internal variables for simulation
    reg low_load = 1'b0;
    reg high_enable = 1'b0;
    reg high_load = 1'b0;

    // Instantiate low (ones) digit and high (tens) digit counters
    counter_nbit #(.WIDTH(4)) LD (
        .clk(clk),
        .enable(enable),
        .data(4'b0000),
        .load(low_load & enable),
        .count(low_digit)
    );

    counter_nbit #(.WIDTH(3)) HD (
        .clk(clk),
        .enable(high_enable & enable),
        .data(3'b0000),
        .load(high_load & enable),
        .count(high_digit)
    );

    // Activate always block on changes with low_digit or
    // high_digit from counter blocks to count from 00 to 59,
    // then roll back to 00 and count again.
    always @(low_digit or high_digit) begin
        low_load = (low_digit == 9) ? 1'b1 : 1'b0;
        high_enable = low_load;
        high_load = (low_digit == 9 & high_digit == 5) ? 1'b1 : 1'b0;
    end

endmodule