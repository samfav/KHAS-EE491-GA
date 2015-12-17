%main programm
loader;
population = reshape(initial_population, 1, population_size, number_of_bits)
index = 1
fitness = fitness_evaluation(population(index,:,:), fitness_function)
while index < maximum_iteration %stop_condition, add test on fitness
    parents = selection(population(index, :,:), number_of_parents)
    new_generation = reproduction(parents, crossover_type, crossover_rate, population_size)
    new_generation_mutated = mutation(new_generation, mutation_rate)
    population(index+1, :, :) = new_generation_mutated
    fitness(index+1, :) = fitness_evaluation(population(index+1,:,:), fitness_function)
    index = index + 1
end

display_output(pop)