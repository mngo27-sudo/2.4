/* counter_nbit_updown-project.v
*      Michael Ngo
*      8-7-26
*      N/A
*/

//Part 1:  Implement the design with behavioral Verilog.  
//         Your module design must use the assignment API definition:
module counter_nbit_updown #(parameter WIDTH = 4)(
    input clk,
    input enable, //allow counter to count when enabled
    input [WIDTH-1:0] data, //data to be loaded when load is active
    input load, //synchronous data load control signal
    input up_down, //async count direction: up (1), down (0), default up
    output reg[WIDTH-1:0] count=0//output count value
);


    //Initialize this modules output "count" to 0

    //Use an always block to increment or decrement "count" output.
    //on the positive edge of this module's "clk" input.
    //Load the counter with this module's "data" input if load is active.
    //Update the count with a non-blocking statement.
    always @(posedge clk) begin 
        if (load == 1) begin
            count <= data;
        end
        else if (enable == 1)begin
            if (up_down == 1) begin
                count <= count + 1'b1;
            end
            else if (up_down == 0) begin
                count <= count - 1'b1;
            end
        end
    end

    

endmodule //counter_nbit_updown
