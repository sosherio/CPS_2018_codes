function [ r ] = loop_response( delta, c )

total_delay_difference = 0;

for i = 1: length(c)
    if (c(i)==0)
        c(i)=-1;
    end
    total_delay_difference = total_delay_difference + c(i) * delta(i); 
end
r = sign (total_delay_difference);

end

