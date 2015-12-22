%this file loads the configuration from config.yaml
%needs to have https://code.google.com/p/yamlmatlab installed


%load configuration 
addpath(genpath(strcat(pwd,'/YAMLMatlab_0.4.3')));
yaml_file = './config.yaml';
config = ReadYaml(yaml_file);

%load initial population
if config.population_path
    initial_population = csvread(config.population_path)
else
    error('No input population')
end

%constant parameters
%general
population_size = config.population_size
number_of_bits = config.number_of_bits
fitness_limit = config.fitness_limit
maximum_iteration = config.maximum_iteration
number_of_parents = config.number_of_parents
%mutation parameter
mutation_rate = config.mutation_rate
%crossover parameters
crossover_rate = config.crossover_rate
crossover_type = config.crossover_type


%load fitness function
if isempty(config.fitness_function)
    error('error no fitness function defined !');
else
    fitness_function = str2func(config.fitness_function) 
end

if size(initial_population, 1) ~= population_size | size(initial_population, 2) ~= number_of_bits
    warning('initial population not valid replaced with random values')
    initial_population = randi([0 1], population_size, number_of_bits);
end