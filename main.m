%main programm
loader;
population = initial_population
index = 1
while test_condition:
    parents = selection(population, index, number_of_parents)
    new_generation = reproduction(parents, crossover_type, crossover_rate, population_size)
    new_generation_mutated = mutation(new_generation, mutation_rate)
    population(:,:,2) = new_generation_mutated
    index = index +1
end