`include "jk_ms.v"

module tb;

reg J, K, clk, reset;
wire Q;

jk_ms dut (
    .J(J),
    .K(K),
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

// Clock: period = 10 time units
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("time=%0t | clk=%b | reset=%b | J=%b | K=%b | Q=%b",
             $time, clk, reset, J, K, Q);
end

initial begin
    reset = 1;
    J = 0;
    K = 0;

    #10 reset = 0;

    // HOLD
    @(negedge clk); J = 0; K = 0;

    // SET
    @(negedge clk); J = 1; K = 0;

    // HOLD
    @(negedge clk); J = 0; K = 0;

    // RESET
    @(negedge clk); J = 0; K = 1;

    // SET
    @(negedge clk); J = 1; K = 0;

    // TOGGLE
    @(negedge clk); J = 1; K = 1;

    // TOGGLE again
    @(negedge clk); J = 1; K = 1;

    // HOLD
    @(negedge clk) J = 0; K = 0;

   
end

endmodule
