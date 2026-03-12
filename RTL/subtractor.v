module subtractor #(parameter WIDTH=32)
(input [WIDTH-1:0]A,
input [WIDTH-1:0]B,
output [WIDTH-1:0]Z,
output cout);
wire [WIDTH-1:0]B_comp;
assign B_comp=~B+1;
adder #(32) sub(.A(A),.B(B_comp),.cin(1'b0),.Z(Z),.cout(cout));
endmodule







