function [delta] = stt_create( chellenge_length, sd )
    n = chellenge_length;
    delta =  1./(normrnd (ones(1,2*n).*1, 1./sd));
end


