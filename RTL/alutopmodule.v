module alu #(parameter WIDTH = 32)
(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [2:0] opcode,
    output reg [WIDTH-1:0] Z,
    output zero,
    output carry,
    output overflow,
    output negative
);

wire [WIDTH-1:0] add_out;
wire [WIDTH-1:0] sub_out;
wire adder_carry,sub_carry;

adder #(WIDTH) ADD (
    .A(A),
    .B(B),
    .cin(0),
    .Z(add_out),
    .cout(adder_carry)
);

subtractor #(WIDTH) SUB (
    .A(A),
    .B(B),
    .Z(sub_out),
    .cout(sub_carry)
);

always @(*) begin
    case(opcode)
        3'b000: Z = add_out;
        3'b001: Z = sub_out;
        3'b010: Z = A & B;
        3'b011: Z = A | B;
        3'b100: Z = A ^ B;
        3'b101: Z = ~A;
        default: Z = 0;
    endcase
end
assign zero=(Z==0);
assign carry=(opcode==3'b000)?adder_carry:(opcode==3'b001)?sub_carry:0;
assign negative=Z[WIDTH-1];
assign overflow=(opcode==3'b000)?((A[WIDTH-1]==B[WIDTH-1])&&(A[WIDTH-1]!=Z[WIDTH-1])):(opcode== 3'b001)?((A[WIDTH-1]!=B[WIDTH-1])&&(A[WIDTH-1]!=Z[WIDTH-1])):0;

endmodule