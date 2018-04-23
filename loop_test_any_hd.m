stages = 64;
number_of_pufs_under_test = 100;
number_of_CRPs_per_puf = 20;
sd = 100;

count = zeros (64,1);
count_same = zeros (64,1);

for puf_instance = 1:number_of_pufs_under_test
    [delta] = loop_create (stages, sd);
    for j=1:number_of_CRPs_per_puf
        c_init = generate_challenge(stages);
        r_init = loop_response(delta,c_init);
        for k = 1:100
            
            for hd=1:stages  
                c_new = c_init;
                index = randperm(64,hd);
                for i=1:hd
                    c_new(index(i))= xor(1, c_init(index(i)));
                end
                
                r_new = loop_response(delta,c_new);

                if r_new == r_init
                    count_same(hd) = count_same(hd) + 1;
                end 
                
                
            end
         
        end
    end
end

final = count_same ./(number_of_CRPs_per_puf*number_of_pufs_under_test*100); 


 
 
 
 
 
