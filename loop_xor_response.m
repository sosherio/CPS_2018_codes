function [ r ] = loop_xor_response( delta, c )
    
    m = size (delta);
    total_delay_difference = zeros (m(1),1);

    for i = 1: length(c)
        if (c(i)==0)
            c(i)=-1;
        end
        total_delay_difference(:) = total_delay_difference(:) + c(i) * delta(:,i); 
    end
    r_each_instance = sign (total_delay_difference);
    
    r = 0;
    for i=1:m(1)
        if r_each_instance(i) == -1
            r_each_instance(i) = 0;
        end
        r = xor (r, r_each_instance(i));
    end
end

