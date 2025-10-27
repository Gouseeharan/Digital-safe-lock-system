module tb_password_lock;

    reg [3:0] user_input;
    reg clk;
    reg reset;
    wire unlock;
    wire alarm;

    password_lock uut (
        .user_input(user_input),
        .clk(clk),
        .reset(reset),
        .unlock(unlock),
        .alarm(alarm)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("Starting Password Lock Test...");
        reset = 1;
        user_input = 4'b0000;
        #10;

        reset = 0;

        // Test incorrect password
        user_input = 4'b1111;
        #10;
        $display("Input: %b | Unlock: %b | Alarm: %b", user_input, unlock, alarm);

        // Test correct password
        user_input = 4'b1010;
        #10;
        $display("Input: %b | Unlock: %b | Alarm: %b", user_input, unlock, alarm);

        // Test another incorrect password
        user_input = 4'b0101;
        #10;
        $display("Input: %b | Unlock: %b | Alarm: %b", user_input, unlock, alarm);

        $finish;
    end
endmodule