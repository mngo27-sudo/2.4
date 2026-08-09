module clock_divider #(parameter CLK_DIV_INT = 10)(
    input clk,
    input pause,
    output reg rco_enable
);

    wire [$clog2(CLK_DIV_INT)-1:0] count;

    counter_nbit_updown #(.WIDTH($clog2(CLK_DIV_INT))) cntr (
        .clk(clk),
        .enable(~pause),
        .data(2**$clog2(CLK_DIV_INT) - CLK_DIV_INT),
        .load(rco_enable),
        .count(count)
    );

    initial rco_enable = 0;

    always @(count) begin
        rco_enable = (count == (2**$clog2(CLK_DIV_INT) - 1)) ? 1'b1 : 1'b0;
    end

endmodule