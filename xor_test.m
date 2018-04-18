instances = 3;
stages = 64;
number_of_pufs_under_test = 100;
number_of_CRPs_per_puf = 500;
sd0 = 100;
sd1 = 100;

count = zeros(1, stages);
for puf_instance = 1:number_of_pufs_under_test
    [w] = xor_create (instances, stages, sd0, sd1);
    for j=1:number_of_CRPs_per_puf
        c = generate_challenge(stages);
        r_init = xor_response(w,c);
        for i = 1:stages
            if c(i) == 1
                c_i_new = 0;
                c_i_original = 1;
            else
                c_i_new = 1;
                c_i_original = 0;
            end
            c(i) = c_i_new;         
            r_new = xor_response(w,c);

            if r_new == r_init
                count(i) = count(i) + 1;
            end
            c(i) = c_i_original; 
        end     
    end
end
count = count ./number_of_CRPs_per_puf;
bar (count)


 
 
 
 
 
