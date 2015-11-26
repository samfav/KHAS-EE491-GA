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

%load fitness function
if isempty(config.fitness_function)
    error('error no fitness function defined !');
else
    fitness_function = str2func(config.fitness_function) 
end