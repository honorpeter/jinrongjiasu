`include "para_def.v"
module stage4_reg_module ( 
                           clk , rst_n , 
                           message_en_in ,
                           message_1_in , message_2_in , message_3_in ,
                           N_type_control_m1_in , N_type_control_m2_in , N_type_control_m3_in ,
                           message_mux_control_m1_in , message_mux_control_m2_in , message_mux_control_m3_in ,
                           message_en_out ,
                           message_1_out , message_2_out , message_3_out  ,
                           N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out , 
                           message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out  
                           );
    input  clk , rst_n ,
           message_en_in , 
           message_1_in , message_2_in , message_3_in , 
           N_type_control_m1_in , N_type_control_m2_in , N_type_control_m3_in , 
           message_mux_control_m1_in , message_mux_control_m2_in , message_mux_control_m3_in ;
    output message_en_out ,
           message_1_out , message_2_out , message_3_out , 
           N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out , 
           message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;
    
    wire                                        clk , rst_n ; 
    wire                                        message_en_in ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]          message_1_in , message_2_in , message_3_in ;
    wire [ `N_type_control_width - 1 : 0]       N_type_control_m1_in , N_type_control_m2_in , N_type_control_m3_in ;
    wire [ `message_mux_control_width - 1 : 0 ] message_mux_control_m1_in , message_mux_control_m2_in , message_mux_control_m3_in ;
    wire                                        message_en_out ;
    wire [ `MAX_MESSAGE_BITS - 1 : 0 ]          message_1_out , message_2_out , message_3_out ;
    wire [ `N_type_control_width - 1 : 0]       N_type_control_m1_out , N_type_control_m2_out , N_type_control_m3_out ;
    wire [ `message_mux_control_width - 1 : 0 ] message_mux_control_m1_out , message_mux_control_m2_out , message_mux_control_m3_out ;
    
      
    reg_m_module # 
      (
       .REG_WIDTH   (1)
      )
      message_en_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_en_in ),
       .q      ( message_en_out )
      );
      
    
    reg_m_module # 
      (
       .REG_WIDTH   (`MAX_MESSAGE_BITS)
      )
      message_1_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_1_in ),
       .q      ( message_1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`MAX_MESSAGE_BITS)
      )
      message_2_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_2_in ),
       .q      ( message_2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`MAX_MESSAGE_BITS)
      )
      message_3_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_3_in ),
       .q      ( message_3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`N_type_control_width)
      )
      N_type_control_m1_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( N_type_control_m1_in ),
       .q      ( N_type_control_m1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`N_type_control_width)
      )
      N_type_control_m2_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( N_type_control_m2_in ),
       .q      ( N_type_control_m2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`N_type_control_width)
      )
      N_type_control_m3_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( N_type_control_m3_in ),
       .q      ( N_type_control_m3_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`message_mux_control_width)
      )
      message_mux_control_m1_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_mux_control_m1_in ),
       .q      ( message_mux_control_m1_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`message_mux_control_width)
      )
      message_mux_control_m2_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_mux_control_m2_in ),
       .q      ( message_mux_control_m2_out )
      );
    
    reg_m_module # 
      (
       .REG_WIDTH   (`message_mux_control_width)
      )
      message_mux_control_m3_reg_4
      (
       .clk    ( clk ),
       .rst_n  ( rst_n ),
       .d      ( message_mux_control_m3_in ),
       .q      ( message_mux_control_m3_out )
      );
    
endmodule
