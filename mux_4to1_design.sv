// Multiplexer 4-ke-1 dengan pendekatan gate level
module mux_4to1_gate (output logic Y, input logic A, B, C, D, S0, S1);
    logic notS0, notS1, and1, and2, and3, and4;

    // Implementasi gerbang logika dasar
    not (notS0, S0);
    not (notS1, S1);
    and (and1, A, notS0, notS1);
    and (and2, B, S0, notS1);
    and (and3, C, notS0, S1);
    and (and4, D, S0, S1);
    or (Y, and1, and2, and3, and4);
endmodule

// Multiplexer 4-ke-1 dengan pendekatan dataflow
module mux_4to1_dataflow (output logic Y, input logic A, B, C, D, S0, S1);
    // Implementasi ekspresi boolean
    assign Y = (A & ~S0 & ~S1) | (B & S0 & ~S1) | (C & ~S0 & S1) | (D & S0 & S1);
endmodule

// Multiplexer 4-ke-1 dengan pendekatan behavioral
module mux_4to1_behavioral (output logic Y, input logic A, B, C, D, S0, S1);
    always_comb begin
        case ({S1, S0})
            2'b00: Y = A;
            2'b01: Y = B;
            2'b10: Y = C;
            2'b11: Y = D;
            default: Y = 1'b0;
        endcase
    end
endmodule
