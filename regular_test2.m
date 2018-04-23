diff = 60;
stages = 64;
count = zeros(stages, 1);
 for puf_instance = 1:100
     [w] = arbiter_create (stages, 100, 100);
     for j=1:200
         c = generate_challenge(stages);
         r_init = arbiter_response(w,c);
         for i = 1:stages-diff
             if c(i) == 1
                 c_i_new = 0;
                 c_i_original = 1;
             else
                 c_i_new = 1;
                 c_i_original = 0;
             end
             
             if c(i+diff) == 1
                 c_i_1_new = 0;
                 c_i_1_original = 1;
             else
                 c_i_1_new = 1;
                 c_i_1_original = 0;
             end
             
             c(i) = c_i_new;   
             c(i+diff) = c_i_1_new;  
             
             r_new = arbiter_response(w,c);

             if r_new == r_init
                 count(i) = count(i) + 1;
             end
             c(i) = c_i_original;
             c(i+diff) = c_i_1_original;
         end     
     end
 end
 count = count ./(200*100);
 
 
 
 
 
