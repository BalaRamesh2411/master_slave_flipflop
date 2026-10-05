`include "sr_ms.v"

module tb;

reg S;
reg R;
reg clk;
reg reset;

wire Q;

sr_ms dut (
    .S     (S),
    .R     (R),
    .clk   (clk),
    .reset (reset),
    .Q     (Q)
);

// Clock
initial begin
    clk = 0;
    repeat(10) #5 clk = ~clk;
end

// Monitor
initial begin
    $monitor("time=%0t | clk=%b | reset=%b | S=%b | R=%b | Q=%b",
             $time, clk, reset, S, R, Q);
end

// Stimulus
initial begin

    reset = 1;
    S = 0;
    R = 0;

    #10;
    reset = 0;

    // HOLD
    @(negedge clk);
    S = 0;
    R = 0;

    // SET
    @(negedge clk);
    S = 1;
    R = 0;

    // HOLD
    @(negedge clk);
    S = 0;
    R = 0;

    // RESET
    @(negedge clk);
    S = 0;
    R = 1;

    // HOLD
    @(negedge clk);
    S = 0;
    R = 0;

    // SET
    @(negedge clk);
    S = 1;
    R = 0;

    // HOLD
    @(negedge clk);
    S = 0;
    R = 0;

    // INVALID
    @(negedge clk);
    S = 1;
    R = 1;

    

end

endmodule
