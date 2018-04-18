function [ r ] = stt_response( delta, c )
n = length (c);
r0_inv = 0;
r1_inv = 0;
for i = 1:n
    if (c(i)==1)
        r1_inv = r1_inv + delta(i);
        r0_inv = r0_inv + delta(i+n);
    else
        r1_inv = r1_inv + delta(i+n);
        r0_inv = r0_inv + delta(i);
    end
end

r0 = 1 / r0_inv;
r1 = 1 / r1_inv;
r = sign (r1 - r0);
end

