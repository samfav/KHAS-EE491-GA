%Function fitness evaluation
%inputs: pop_in=population before mutation, fitness_function
%outputs: fitness=overall fitness value
function fitness = fitness_evaluation( pop_in, fitness_function )
    [number_of_individuals,number_of_bits]=size(pop_in); % population size is N 
                                                         % bit lengths e.g.: 64
   %y=x^2 solution
   
   
                                                         
    %fitnesstmp=sum(pop_in, 2);
    %fitnesstmp=pop_in;
    %
    %different fitness function :
    %y = x+3*sin(2*x)*cos(3*x)
    
    %z=x+3*sin(2*x)*cos(3*x)+2
    x= bi2de(pop_in(:,1:end));
    %y= bi2de(pop_in(:,33:64));
    fitnesstmp=1./abs(x+3.*sin(2.*x).*cos(3.*x)+2);
    
    fitness=reshape(fitnesstmp, number_of_individuals,1);
    
end

