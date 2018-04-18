function [ r ] = xor_response( w, c )
    [instances, ] = size (w);
    n = length(c);
    phi = ones (n+1,1);
    phi(n+1) = 1;
    for i = 1:n
        for l = i:n
                phi(i)= phi(i)* ((-1)^c(l));
        end
    end
    r_each_instance = sign (w * phi);
    
    r = 0;
    for i=1:instances
        if r_each_instance(i) == -1
            r_each_instance(i) = 0;
        end
        r = xor (r, r_each_instance(i));
    end
end

