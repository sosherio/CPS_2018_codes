 stages = 64;
 count = zeros(1, stages);
 for puf_instance = 1:100
     [w] = create_arbiter (stages, 100, 100);
     for j=1:500
         c = challenge_generator(stages);
         r_init = create_regular_response(w,c);
         for i = 1:stages-1
             if c(i) == 1
                 c_i_new = 0;
                 c_i_original = 1;
             else
                 c_i_new = 1;
                 c_i_original = 0;
             end
             
             if c(i+1) == 1
                 c_i_1_new = 0;
                 c_i_1_original = 1;
             else
                 c_i_1_new = 1;
                 c_i_1_original = 0;
             end
             
             c(i) = c_i_new;   
             c(i+1) = c_i_1_new;  
             
             r_new = create_regular_response(w,c);

             if r_new == r_init
                 count(i) = count(i) + 1;
             end
             c(i) = c_i_original;
             c(i+1) = c_i_1_original;
         end     
     end
 end
 count = count ./500;
 bar (count)
 
 
 
 
 
