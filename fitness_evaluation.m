function fitness = fitness_evaluation( pop_in, fitness_function )
    [ population_size bit_lengths generation_index]=size(pop_in); % population size is N 
                                                                 % bit lengths e.g.: 64
                   
    fitnesstmp=sum(pop_in, 2);
    %
    %different fitness function :
    %y = x+3*sin(2*x)*cos(3*x)
    %a= bi2de(pop_in(:,1:32));
    %b= bi2de(pop_in(:,33:64));
    %f= a.^3 + b.^2;
    
    fitness=reshape(fitnesstmp, population_size, 1);
    
end

