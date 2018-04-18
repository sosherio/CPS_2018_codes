function [w] = arbiter_create( stages, sd0, sd1 )
    n = stages;
    delta0 =  normrnd (zeros(1,n), 1./sd0);
    delta1 =  normrnd (zeros(1,n), 1./sd1);
    w = zeros (1, n+1);
    w(1) = delta0(1) - delta1(1);
    w(n+1) = delta0(n) + delta1(n);
    for i = 2:n
        w(i) = delta0(i-1) + delta1(i-1) + delta0(i) - delta1(i);
    end
end

