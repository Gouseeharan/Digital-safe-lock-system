module password_lock (
    input [3:0] user_input,
    input clk,
    input reset,
    output reg unlock,
    output reg alarm
);

    parameter [3:0] PASSWORD = 4'b1010;  // preset password

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            unlock <= 0;
            alarm <= 0;
        end else begin
            if (user_input == PASSWORD) begin
                unlock <= 1;
                alarm <= 0;
            end else begin
                unlock <= 0;
                alarm <= 1;
            end
        end
    end
endmodule