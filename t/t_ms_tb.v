`include "t_ms.v"

module tb;

reg T;
reg clk;
reg reset;

wire Q;

t_ms dut (
    .T     (T),
    .clk   (clk),
    .reset (reset),
    .Q     (Q)
);

// Clock
initial begin
    clk = 0;

    repeat (20) begin
        #5 clk = ~clk;
    end
end

// Monitor
initial begin
    $monitor("time=%0t | clk=%b | reset=%b | T=%b | Q=%b",
             $time, clk, reset, T, Q);
end

// Stimulus
initial begin

    // Reset
    reset = 1;
    T = 0;
    #10;

    reset = 0;

    // T = 0 -> HOLD
    T = 0;
    #20;

    // T = 1 -> TOGGLE
    T = 1;
    #20;

    // T = 1 -> TOGGLE
    T = 1;
    #20;

    // T = 0 -> HOLD
    T = 0;
    #20;

    // T = 1 -> TOGGLE
    T = 1;
    #20;

    

end

endmodule
