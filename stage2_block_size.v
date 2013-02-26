`include "para_def.v"
module stage2_block_size_module ( block_size_control_m1 , block_size_control_m2 , block_size_control_m3 , block_size_data);
    input  block_size_control_m1 , block_size_control_m2 , block_size_control_m3 ;
    output block_size_data ;
    
    wire [ `block_size_control_width - 1 : 0 ] block_size_control_m1 , block_size_control_m2 , block_size_control_m3 ;
    wire [ `block_size_data_bits - 1 : 0 ]     block_size_data ;
    
    assign block_size_data = ( block_size_control_m1 == `block_size_35 )? 
                                   ( 
                                   ( block_size_control_m2 == `block_size_35 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 126 :
                                         ( block_size_control_m3 == `block_size_22 )? 114 :
                                         ( block_size_control_m3 == `block_size_21 )? 112 :
                                         ( block_size_control_m3 == `block_size_12 )? 103 : 92
                                         ):
                                   ( block_size_control_m2 == `block_size_22 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 114 :
                                         ( block_size_control_m3 == `block_size_22 )? 100 :
                                         ( block_size_control_m3 == `block_size_21 )? 100 :
                                         ( block_size_control_m3 == `block_size_12 )? 90  : 78
                                         ):
                                   ( block_size_control_m2 == `block_size_21 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 112 :
                                         ( block_size_control_m3 == `block_size_22 )? 100 :
                                         ( block_size_control_m3 == `block_size_21 )? 98  :
                                         ( block_size_control_m3 == `block_size_12 )? 90  : 78
                                         ):
                                   ( block_size_control_m2 == `block_size_12 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 104 :
                                         ( block_size_control_m3 == `block_size_22 )? 90  :
                                         ( block_size_control_m3 == `block_size_21 )? 90  :
                                         ( block_size_control_m3 == `block_size_12 )? 80  : 68
                                         ):
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 92  :
                                         ( block_size_control_m3 == `block_size_22 )? 78  :
                                         ( block_size_control_m3 == `block_size_21 )? 78  :
                                         ( block_size_control_m3 == `block_size_12 )? 68  : 56
                                         )
                                   ):
                                    
                             ( block_size_control_m1 == `block_size_22 )? 
                                   ( 
                                   ( block_size_control_m2 == `block_size_35 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 114 :
                                         ( block_size_control_m3 == `block_size_22 )? 100 :
                                         ( block_size_control_m3 == `block_size_21 )? 100 :
                                         ( block_size_control_m3 == `block_size_12 )? 90  : 78
                                         ):
                                   ( block_size_control_m2 == `block_size_22 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 100 :
                                         ( block_size_control_m3 == `block_size_22 )? 88  :
                                         ( block_size_control_m3 == `block_size_21 )? 86  :
                                         ( block_size_control_m3 == `block_size_12 )? 78  : 66
                                         ):
                                   ( block_size_control_m2 == `block_size_21 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 100 :
                                         ( block_size_control_m3 == `block_size_22 )? 86  :
                                         ( block_size_control_m3 == `block_size_21 )? 86  :
                                         ( block_size_control_m3 == `block_size_12 )? 76  : 64
                                         ):
                                   ( block_size_control_m2 == `block_size_12 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 90  :
                                         ( block_size_control_m3 == `block_size_22 )? 78  :
                                         ( block_size_control_m3 == `block_size_21 )? 76  :
                                         ( block_size_control_m3 == `block_size_12 )? 68  : 56
                                         ):
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 78  :
                                         ( block_size_control_m3 == `block_size_22 )? 66  :
                                         ( block_size_control_m3 == `block_size_21 )? 64  :
                                         ( block_size_control_m3 == `block_size_12 )? 56  : 44
                                         )
                                   ):
                                    
                             ( block_size_control_m1 == `block_size_21 )? 
                                   ( 
                                   ( block_size_control_m2 == `block_size_35 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 112 :
                                         ( block_size_control_m3 == `block_size_22 )? 100 :
                                         ( block_size_control_m3 == `block_size_21 )? 98  :
                                         ( block_size_control_m3 == `block_size_12 )? 90  : 78
                                         ):
                                   ( block_size_control_m2 == `block_size_22 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 100 :
                                         ( block_size_control_m3 == `block_size_22 )? 86  :
                                         ( block_size_control_m3 == `block_size_21 )? 86  :
                                         ( block_size_control_m3 == `block_size_12 )? 76  : 64
                                         ):
                                   ( block_size_control_m2 == `block_size_21 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 98  :
                                         ( block_size_control_m3 == `block_size_22 )? 86  :
                                         ( block_size_control_m3 == `block_size_21 )? 84  :
                                         ( block_size_control_m3 == `block_size_12 )? 76  : 64
                                         ):
                                   ( block_size_control_m2 == `block_size_12 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 90  :
                                         ( block_size_control_m3 == `block_size_22 )? 76  :
                                         ( block_size_control_m3 == `block_size_21 )? 76  :
                                         ( block_size_control_m3 == `block_size_12 )? 66  : 54
                                         ):
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 78  :
                                         ( block_size_control_m3 == `block_size_22 )? 64  :
                                         ( block_size_control_m3 == `block_size_21 )? 64  :
                                         ( block_size_control_m3 == `block_size_12 )? 54  : 42
                                         )
                                   ):
                                    
                             ( block_size_control_m1 == `block_size_12 )? 
                                   ( 
                                   ( block_size_control_m2 == `block_size_35 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 104 :
                                         ( block_size_control_m3 == `block_size_22 )? 90  :
                                         ( block_size_control_m3 == `block_size_21 )? 90  :
                                         ( block_size_control_m3 == `block_size_12 )? 80  : 68
                                         ):
                                   ( block_size_control_m2 == `block_size_22 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 90  :
                                         ( block_size_control_m3 == `block_size_22 )? 78  :
                                         ( block_size_control_m3 == `block_size_21 )? 76  :
                                         ( block_size_control_m3 == `block_size_12 )? 68  : 56
                                         ):
                                   ( block_size_control_m2 == `block_size_21 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 90  :
                                         ( block_size_control_m3 == `block_size_22 )? 76  :
                                         ( block_size_control_m3 == `block_size_21 )? 76  :
                                         ( block_size_control_m3 == `block_size_12 )? 66  : 54
                                         ):
                                   ( block_size_control_m2 == `block_size_12 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 80  :
                                         ( block_size_control_m3 == `block_size_22 )? 68  :
                                         ( block_size_control_m3 == `block_size_21 )? 66  :
                                         ( block_size_control_m3 == `block_size_12 )? 58  : 46
                                         ):
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 68  :
                                         ( block_size_control_m3 == `block_size_22 )? 56  :
                                         ( block_size_control_m3 == `block_size_21 )? 54  :
                                         ( block_size_control_m3 == `block_size_12 )? 46  : 34
                                         )
                                   ):
                                   ( 
                                   ( block_size_control_m2 == `block_size_35 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 92  :
                                         ( block_size_control_m3 == `block_size_22 )? 78  :
                                         ( block_size_control_m3 == `block_size_21 )? 78  :
                                         ( block_size_control_m3 == `block_size_12 )? 68  : 56
                                         ):
                                   ( block_size_control_m2 == `block_size_22 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 78  :
                                         ( block_size_control_m3 == `block_size_22 )? 66  :
                                         ( block_size_control_m3 == `block_size_21 )? 64  :
                                         ( block_size_control_m3 == `block_size_12 )? 56  : 44
                                         ):
                                   ( block_size_control_m2 == `block_size_21 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 78  :
                                         ( block_size_control_m3 == `block_size_22 )? 64  :
                                         ( block_size_control_m3 == `block_size_21 )? 64  :
                                         ( block_size_control_m3 == `block_size_12 )? 54  : 42
                                         ):
                                   ( block_size_control_m2 == `block_size_12 )? 
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 68  :
                                         ( block_size_control_m3 == `block_size_22 )? 56  :
                                         ( block_size_control_m3 == `block_size_21 )? 54  :
                                         ( block_size_control_m3 == `block_size_12 )? 46  : 34
                                         ):
                                         (
                                         ( block_size_control_m3 == `block_size_35 )? 56  :
                                         ( block_size_control_m3 == `block_size_22 )? 44  :
                                         ( block_size_control_m3 == `block_size_21 )? 42  :
                                         ( block_size_control_m3 == `block_size_12 )? 34  : 22
                                         )
                                   );
endmodule
