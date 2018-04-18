function [delta] = loop_create( stages, sd )
    n = stages;
    delta =  normrnd (zeros(1,n), 1./sd);
end


