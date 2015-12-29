%Function fitness evaluation
%inputs: pop_in=population before mutation, fitness_function
%outputs: fitness=overall fitness value
function fitness = fitness_evaluation( pop_in, fitness_function )
    [number_of_individuals,number_of_bits]=size(pop_in); % population size is N 
                                                         % bit lengths e.g.: 64
                                                     
    min_v=-pi;
    max_v=+pi;
    
    x= min_v+((max_v-min_v)/(2^number_of_bits-1))*bi2de(pop_in(:,1:end));
 
    %fitnesstmp=1./abs(x+3.*sin(2.*x).*cos(3.*x)+3);
    fitnesstmp=x.^2+1;
    fitness=reshape(fitnesstmp, number_of_individuals,1);
    
end

