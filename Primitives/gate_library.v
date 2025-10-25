// ----------------------------------------------------------------------------------
// FILE NAME:   gate_library.v
// FOLDER:      primitives/
// DESCRIPTION: Defines the fundamental 1-bit and CMOS-level gates used as
//              primitives for the entire ALU design.
// ----------------------------------------------------------------------------------
// MODULES (in order of appearance in this file):
//  - fulladder_1 (1-bit)
//  - fa_carry
//  - fa_sum
//  - substractor_1 (1-bit)
//  - and_gate (1-bit)
//  - or_gate (1-bit)
//  - xor_gate (1-bit)
//  - cmosnand
//  - cmosnor
//  - cmosinv
// ----------------------------------------------------------------------------------

// 1 bit Full Adder using CMOS
module fulladder_1 (sum, cout, a, b, cin);
    input a, b, cin;
    output sum, cout;
    fa_sum SUM (sum, a, b, cin);
    fa_carry CARRY (cout, a, b, cin);
endmodule
module fa_carry (cout, a, b, cin);//carry out logic
     input a, b, cin;
     output cout;

     wire t1, t2, t3;
    and_gate A1 (t1, a, b);
    xor_gate X1 (t2, a, b);
    and_gate A2 (t3, t2, cin);
    or_gate O1 (cout, t1, t3);  
endmodule
module fa_sum (sum, a, b, cin);// sum logic
   input a, b, cin;
   output sum;
   wire t1, t2;

   xor_gate X1 (t1, a, b);
   xor_gate X2 (sum, t1, cin);
endmodule
// 1bit subtractor using Full Adder
module substractor_1(diff, bout, a, b, bin);
    input a, b, bin;
    output diff, bout;

    wire b_not;
    cmosinv N1(b_not, b); // Invert b to use in subtraction
    fulladder_1 FA(diff, bout, a, b_not, bin); // Use full adder for subtraction
endmodule
// Gates For 1-bit
// AND Gate
module and_gate(f, x, y);
    input x, y;
    output f;
    supply1 vdd;
    supply0 gnd;

    wire a;
    cmosnand N6 (a, x, y); //NAND Gate 
    cmosinv N7 (f, a); // Invert the output of NOR to get AND    
endmodule
// OR Gate 
module or_gate(f, x, y);
    input x, y;
    output f;
    supply1 vdd;
    supply0 gnd;

    wire a;
    cmosnor N8 (a, x, y); // NOR Gate
    cmosinv N9 (f, a); // Invert the output of NOR to get OR
endmodule
// XOR Gate
module xor_gate (f, A, B);
    input A, B;
    output f;
    supply1 vdd;
    supply0 gnd;

    wire not_A, not_B, c, d;
    cmosinv N1 (not_A, A); // Invert A
    cmosinv N2 (not_B, B); // Invert B
    and_gate N3 (c, B, not_A); // B AND NOT A
    and_gate N4 (d, A, not_B); // A AND NOT B
    or_gate N5  (f, c, d); // OR the results
endmodule
// CMOS Gate Implementation :---
// NAND Gate
module cmosnand (f, x, y);
    input x, y;
    output f;
    supply1 vdd;
    supply0 gnd;
    wire a;
    // Pull up Network
    pmos p1 (f, vdd, x);
    pmos p2 (f, vdd, y);
    // Pull down Network
    nmos n1 (f, a, x);
    nmos n2 (a, gnd, y);
endmodule

// NOR Gate 
module cmosnor (f,x, y);
     input x, y;
     output f;
     supply0 gnd;
     supply1 vdd;
     wire a;
      // Pull up Network 
     pmos p3 (a, vdd, x);
     pmos p4 (f, a, y); 
     // Pull down Network
     nmos n3 (f, gnd, x);
     nmos n4 (f, gnd, y);
endmodule

// NOT Gate
module cmosinv (f, x);
    input x;
    output f;
    supply1 vdd;
    supply0 gnd;

    pmos p5 (f, vdd, x); // Pull up Network
    nmos n5 (f, gnd, x); // Pull down Network
endmodule