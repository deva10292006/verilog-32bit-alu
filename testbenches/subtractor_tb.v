module subtractor_tb;

parameter WIDTH = 32;

reg  [WIDTH-1:0] A,B;
wire [WIDTH-1:0] Z;
wire cout;

subtractor #(WIDTH) DUT (
    .A(A),
    .B(B),
    .Z(Z),
    .cout(cout)
);

initial begin
    $dumpfile("subtractor.vcd");
    $dumpvars(0, subtractor_tb);
    $monitor($time,"A=%b,B=%b,Z=%b,cout=%b",A,B,Z,cout);

    A = 10; B = 3;
    #10;

    A = 5; B = 10;
    #10;

    $finish;
end

endmodule