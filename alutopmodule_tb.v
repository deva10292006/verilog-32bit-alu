module alu_tb;

parameter WIDTH = 32;

reg  [WIDTH-1:0] A, B;
reg  [2:0] opcode;
wire [WIDTH-1:0] Z;
wire zero;
wire caryy;
wire negative;
wire overflow;


alu #(WIDTH) DUT (
    .A(A),
    .B(B),
    .opcode(opcode),
    .Z(Z),
    .zero(zero),
    .carry(carry),
    .negative(negative),
    .overflow(overflow)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
    $monitor($time,"A=%b,B=%b,opcode=%b,Z=%b,zero=%b,carry=%b,negative=%b,overflow=%b",A,B,opcode,Z,zero,carry,negative,overflow,);

    A = 10;
    B = 3;
    opcode = 3'b000;
    #10 opcode = 3'b001;
    #10 opcode = 3'b010;
    #10 opcode = 3'b011;
    #10 opcode = 3'b100; 
    #10 opcode = 3'b101;
    $finish;
end

endmodule