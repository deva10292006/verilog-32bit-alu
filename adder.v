module adder #(parameter WIDTH=32)
(
input [WIDTH-1:0] A,
input [WIDTH-1:0] B,
input cin,
output [WIDTH-1:0] Z,
output cout
);
    assign{cout,Z}=A+B;
endmodule



