module spi_tb ;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;
reg miso;

wire mosi;
wire cs;
wire done;

// Instantiate Design
spi_master uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .miso(miso),
    .mosi(mosi),
    .cs(cs),
    .done(done)
);

// Clock generation (10ns period)
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    start = 0;
    miso = 0;
    data_in = 8'b10101010;

    #20 rst = 0;

    // Start SPI transfer
    #10 start = 1;
    #10 start = 0;

    // Simulate MISO response
    #30 miso = 1;
    #20 miso = 0;
    #20 miso = 1;
    #20 miso = 0;

    #200 $finish;
end

endmodule