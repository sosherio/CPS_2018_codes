function [ r ] = arbiter_response( w, c )
n = length (c);
phi = ones (n+1,1);
phi(n+1) = 1;
for i = 1:n
    for l = i:n
            phi(i)= phi(i)* ((-1)^c(l));
    end
end
r = sign (w * phi);
end

