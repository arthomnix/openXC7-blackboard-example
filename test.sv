module test(
    input logic clk,
    input logic [3:0] btn,
    input logic [11:0] sw,
    output logic [9:0] led,
    output logic [2:0] RGB_led_A,
    output logic [2:0] RGB_led_B
);
    logic [24:0] count;
    logic [11:0] shift;

    always_ff @(posedge clk)
        count <= count + 1;

    always_ff @(posedge count[24])
        if (btn[0])
            shift <= sw;
        else
            shift <= (shift << 1) | (shift >> 11);

    assign led = shift[9:0];
    assign RGB_led_A[1] = shift[10];
    assign RGB_led_B[1] = shift[11];

    assign RGB_led_A[0] = 0;
    assign RGB_led_A[2] = 0;
    assign RGB_led_B[0] = 0;
    assign RGB_led_B[2] = 0;

    fcapz_ela_xilinx7 #(
        .SAMPLE_W(25),
        .DEPTH(1024),
        .SINGLE_CHAIN_BURST(0) // does not work at all with SINGLE_CHAIN_BURST enabled for unclear reasons
    ) ela (
        .sample_clk (clk),
        .sample_rst (btn[0]),
        .probe_in   (count)
    );
endmodule
