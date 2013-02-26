`include "para_def.v"
module stage2_tb ;
    reg                                            clk ;
    reg                                            rst_n ;
    reg  [ `MAX_ORIGINAL_DATA_BITS - 1 : 0 ]       d1 , d2 , d3 ;
    reg                                            m_en ;
    wire [ `max_block_bits - 1 : 0 ]               d_o ;
    wire                                           m_en_o;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]             m1 , m2 , m3 ;
    wire [ `N_type_control_width - 1 : 0]          N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out ;
    wire [ `message_mux_control_width - 1 : 0 ]    message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;
    wire [ `message_number_data_bits - 1 : 0 ]     message_number_data_out ;
    
    stage2_opra_encode_module stage2_opra_encode( 
                                                 .clk                        ( clk ), 
                                                 .rst_n                      ( rst_n ), 
                                                 .original_data_1            ( d1 ), 
                                                 .original_data_2            ( d2 ), 
                                                 .original_data_3            ( d3 ), 
                                                 .message_en_in              ( m_en ),
                                                 .block_data_out             ( d_o ), 
                                                 .message_en_out             ( m_en_o ),
                                                 .message_1_out              ( m1 ), 
                                                 .message_2_out              ( m2 ), 
                                                 .message_3_out              ( m3 ),
                                                 .N_type_control_m1_out      ( N_type_control_m1_out ), 
                                                 .N_type_control_m2_out      ( N_type_control_m2_out ), 
                                                 .N_type_control_m3_out      ( N_type_control_m3_out ),
                                                 .message_mux_control_m1_out ( message_mux_control_m1_out ),
                                                 .message_mux_control_m2_out ( message_mux_control_m2_out ),
                                                 .message_mux_control_m3_out ( message_mux_control_m3_out ),
                                                 .message_number_data_out    ( message_number_data_out )
                                                 );
    
    initial
    begin
        rst_n = 0;
        clk = 0;
        m_en = 1;
        d1 = 264'b010000010100111001001110111111111111111111111111111111110000111100001111000011110000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        d2 = 264'b010000010100111001010011010101010101010101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        d3 = 264'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        
        # 100 rst_n = 1;
        # 20
        d2 = 264'b010000010100111001001110111111111111111111111111111111110000111100001111000011110000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        d1 = 264'b010000010100111001010011010101010101010101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        d3 = 264'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        

    end

    always #40 clk = ~clk;
endmodule