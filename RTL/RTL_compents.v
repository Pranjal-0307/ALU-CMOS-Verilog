// ----------------------------------------------------------------------------------
// FILE NAME :-- rtl_components.v
// DESCRIPTION :-- 8-bit components used by the main bit8ALU module.
// ----------------------------------------------------------------------------------

//8 bit Full Adder
module FA8bit(f, Cout, a, b, Cin);
    input [7:0] a, b;
    input Cin;
    output Cout;
    output [7:0] f;

    wire [6:0] C;  // Internal carries (C[6:0]) for bits 1 to 7
    fulladder_1 FA0(f[0], C[0], a[0], b[0], Cin); // First bit with Cin as 0
    genvar i;
    generate
        for (i = 1; i < 7; i = i + 1) begin
            fulladder_1 FA(f[i], C[i], a[i], b[i], C[i-1]);
        end
    endgenerate
    fulladder_1 FA7(f[7], Cout, a[7], b[7], C[6]);
endmodule
// 8 bit Subtractor
module sub8bit(diff, bout, a, b);
    input [7:0] a, b;
    output [7:0] diff;
    output bout;

    wire [6:0] B;  // Borrow wires
    substractor_1 S0(diff[0], B[0], a[0], b[0], 1'b1); // Initial bin = 1 (for 2's comp)
    genvar i;
    generate
        for (i = 1; i < 7; i = i + 1) 
        begin
            substractor_1 S(diff[i], B[i], a[i], b[i], B[i-1]); 
        end
    endgenerate
    substractor_1 S7(diff[7], bout, a[7], b[7], B[6]); 
endmodule
// Other Fundamental Gates used in the ALU:--
// 8-bit gates for ALU operations:--
//OR Gate for 8-bit inputs
module or_gate8bit(f, x, y);
    input [7:0] x, y;
    output[7:0] f;
    genvar i;

    generate
        for (i = 0; i < 8; i = i + 1) 
        begin // generating 8 OR gates
            or_gate O1(f[i], x[i], y[i]);
        end
    endgenerate
endmodule 
//AND Gate for 8-bit inputs   
module and_gate8bit(f, x, y);
    input [7:0] x, y;
    output[7:0] f;
    genvar i;

    generate
        for (i = 0; i < 8; i = i + 1) 
        begin  // generating 8 AND gates 
            and_gate A1(f[i], x[i], y[i]);
        end
    endgenerate
endmodule    
//NOT Gate for 8-bit inputs
module not_gate8bit(f, x);
    input [7:0] x;
    output[7:0] f;
    genvar i;

    generate
        for (i = 0; i < 8; i = i + 1)
        begin // generating 8 NOT gates
         cmosinv C1(f[i], x[i]);
        end
    endgenerate
endmodule    
//XOR Gate for 8-bit inputs
module xor_gate8bit(f, x, y);
    input [7:0] x, y;
    output[7:0] f;
    genvar i;

    generate
        for (i = 0; i < 8; i = i + 1) 
        begin 
            xor_gate A1(f[i], x[i], y[i]);
        end
    endgenerate
endmodule