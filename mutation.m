%Function mutation
%inputs: pop_in=population before mutation, mutprob=mutation probability
%outputs: pop_out=population after mutation
function pop_out = mutation( pop_in, mutprob )

    [number_of_individuals,number_of_bits]=size(pop_in);    
    total_bits=number_of_individuals*number_of_bits;
    
    number_of_mutation_bits=round(total_bits*mutprob);
    temp_in = reshape(pop_in,1,[]);
    mutation_bit_index=randperm(total_bits);
    mutation_bit_index=sort(mutation_bit_index(1:number_of_mutation_bits));
    

    
    temp_in(mutation_bit_index)=1-temp_in(mutation_bit_index);
    
    
    pop_out=reshape(temp_in,number_of_individuals,number_of_bits);
    
end

