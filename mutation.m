function pop_out = mutation( pop_in, prob )

    [Number_of_Individuals,Number_of_bits,x]=size(pop_in);    
    Count_of_Rnd_Nrs=Number_of_Individuals*Number_of_bits;
    temp_in = reshape(pop_in,[1,Count_of_Rnd_Nrs]);
    sizArray = size(temp_in);
    toChangeIdx = rand(sizArray) < prob;
    temp_in(toChangeIdx) = 1-temp_in(toChangeIdx);
    
    pop_out=reshape(temp_in,[1,Number_of_Individuals,Number_of_bits]);
    
end

