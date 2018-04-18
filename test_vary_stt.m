 stages = 128;
 total = zeros (1,60);
 for stages = 5:5:300
     count = zeros(1, stages);
     for puf_instance = 1:10
         [delta] = create_stt (stages, 10);
         for j=1:100
             c = challenge_generator(stages);
             r_init = create_stt_response(delta,c);
             for i = 1:stages
                 if c(i) == 1
                     c_i_new = 0;
                     c_i_original = 1;
                 else
                     c_i_new = 1;
                     c_i_original = 0;
                 end
                 c(i) = c_i_new;         
                 r_new = create_stt_response(delta,c);

                 if r_new == r_init
                     count(i) = count(i) + 1;
                 end
                 c(i) = c_i_original; 
             end     
         end
     end
     count = count ./10;
     total(stages/5) = mean (count);
 end
 plot (5:5:300, total)  