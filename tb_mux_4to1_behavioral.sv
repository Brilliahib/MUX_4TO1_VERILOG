module tb_mux_4to1_behavioral;
    logic A, B, C, D, S0, S1;
    logic Y;
    
    // Instansiasi modul behavioral
    mux_4to1_behavioral uut (.Y(Y), .A(A), .B(B), .C(C), .D(D), .S0(S0), .S1(S1));
    
    initial begin
        $monitor("A=%b, B=%b, C=%b, D=%b, S0=%b, S1=%b, Y=%b", A, B, C, D, S0, S1, Y);
        
        // Test Case 1
        A = 1; B = 0; C = 0; D = 0; S0 = 0; S1 = 0;
        #10;
        
        // Test Case 2
        A = 0; B = 1; C = 0; D = 0; S0 = 1; S1 = 0;
        #10;
        
        // Test Case 3
        A = 0; B = 0; C = 1; D = 0; S0 = 0; S1 = 1;
        #10;
        
        // Test Case 4
        A = 0; B = 0; C = 0; D = 1; S0 = 1; S1 = 1;
        #10;
        
        $finish;
    end
endmodule
