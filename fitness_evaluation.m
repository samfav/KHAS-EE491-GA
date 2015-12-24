function fitness = fitness_evaluation( pop_in, fitness_function )
    [ population_size bit_lengths generation_index]=size(pop_in); % population size is N 
                                                                 % bit lengths e.g.: 64
                   
    fitnesstmp=sum(pop_in, 2);
    fitness=reshape(fitnesstmp, population_size, 1);
    %different fitness function :
    %y = x+3*sin(2*x)*cos(3*x)
    
end

