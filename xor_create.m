function [w] = xor_create( instances, stages, sd0, sd1 )
    n = stages;
    w = zeros (instances, n+1);
    for j = 1:instances
        delta0 =  normrnd (zeros(1,n), 1./sd0);
        delta1 =  normrnd (zeros(1,n), 1./sd1);
        w(j,1) = delta0(1) - delta1(1);
        w(j,n+1) = delta0(n) + delta1(n);
        for i = 2:n
            w(j,i) = delta0(i-1) + delta1(i-1) + delta0(i) - delta1(i);
        end
    end
    
end

