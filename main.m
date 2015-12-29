%main programm
clear;
close;
clc;

loader;

%encoder might be used
population = reshape(initial_population, population_size, number_of_bits,1);
index = 1;

fitness(:,1) = fitness_evaluation(population(:,:,index),fitness_function); 
overallfitness(index)=sum(fitness(:,1));

while index < maximum_iteration %stop_condition, add test on fitness
    parents = selection(2, population(:,:,index),number_of_parents,fitness(:,index),max_min);
    parents_fitness = fitness_evaluation(parents,fitness_function); 
  
    new_generation = reproduction(parents, crossover_type,crossover_rate, population_size, parents_fitness, crossover_Parents_Elitism, crossover_Parents_selection_type,max_min); 
    new_generation_mutated = mutation(new_generation, mutation_rate);
    population( :, :,index+1) = new_generation_mutated;
    fitness(:,index+1) = fitness_evaluation(population(:,:,index+1), fitness_function);
    
    overallfitness(index+1)=sum(fitness(:,index+1));
    
    index = index + 1;
   
end

solutions=fitness(:,500).*0.00000001;

%PLOTTING

subplot(2,1,1)
fplot(fitness_function,[-1 1],'r')
title('Fitness Function')
xlabel('x')
ylabel('y')
legend(func2str(fitness_function))
hold on
plot(solutions,0,'x','MarkerSize',20)
grid on

subplot(2,1,2)
plot(overallfitness)
title('Fitness vs. Generation')
xlabel('Generation')
ylabel('Fitness')
legend('Overall Fitness')
grid on
