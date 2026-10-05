module sr_ms(
    input S,
    input R,
    input clk,
    input reset,
    output reg Q
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        Q <= 1'b0;
    else
    begin
        case ({S,R})
            2'b00: Q <= Q;      // Hold
            2'b01: Q <= 1'b0;   // Reset
            2'b10: Q <= 1'b1;   // Set
            2'b11: Q <= 1'bx;   // Invalid
        endcase
    end
end

endmodule
