function [delta] = loop_xor_create( instances, stages, sd )
    delta = normrnd (zeros(instances,stages), 1./sd);
end

