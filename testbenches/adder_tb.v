module adder_tb;

    parameter WIDTH = 32;

    reg  [WIDTH-1:0] A, B;
    reg  cin;
    wire [WIDTH-1:0] Z;
    wire cout;

    adder #(WIDTH) DUT (
        .A(A),
        .B(B),
        .cin(cin),
        .Z(Z),
        .cout(cout)
    );

    initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, adder_tb);

        $monitor($time, " A=%h, B=%h, cin=%b, Z=%h, cout=%b",
                 A, B, cin, Z, cout);

        #5  A = 32'habcd21;  B = 32'h1234ad;  cin = 0;
        #10 A = 32'd1233459; B = 32'd342167;
        #15 A = 32'h123acb;

        #20 $finish;
    end

endmodule