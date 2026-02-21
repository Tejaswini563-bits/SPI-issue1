module spi (
    input clk,
    input rst,
    input start,
    input [7:0] data_in,
    input miso,
    output reg mosi,
    output reg cs,
    output reg done
);

reg [3:0] bit_count;
reg [7:0] shift_reg;
reg [1:0] state;

parameter IDLE = 2'b00,
          TRANSFER = 2'b01,
          FINISH = 2'b10;

always @(posedge clk or posedge rst)
begin
    if (rst) begin
        state <= IDLE;
        cs <= 1;
        done <= 0;
        bit_count <= 0;
    end
    else begin
        case(state)

        IDLE: begin
            done <= 0;
            cs <= 1;
            if (start) begin
                cs <= 0;
                shift_reg <= data_in;
                bit_count <= 0;
                state <= TRANSFER;
            end
        end

        TRANSFER: begin
            mosi <= shift_reg[7];
            shift_reg <= {shift_reg[6:0], miso};
            bit_count <= bit_count + 1;

            if (bit_count == 7)
                state <= FINISH;
        end

        FINISH: begin
            cs <= 1;
            done <= 1;
            state <= IDLE;
        end

        endcase
    end
end

endmodule