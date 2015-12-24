function Selection_of_Parents=selection(Selection_Type,Population,Parent_Size,fitness_values)
[ population_size bit_lengths generation_index]=size(Population); % population size is N 
                                                                 % bit lengths e.g.: 64
                                                                 % generation_index is nth generation of algorithm
Selection_of_Parents= zeros(Parent_Size,bit_lengths,1);
                                                                     
if Selection_Type==1; % Random Selection
    Random_Parents=randperm(population_size);
    New_Parent_indices=Random_Parents(1:Parent_Size);

    for jj=1:Parent_Size
        Selection_of_Parents(jj,:,generation_index)=Population(New_Parent_indices(jj),:,generation_index);
    end
   
elseif Selection_Type==2; % Roulette Selection
    
    Total_Fitness=sum(fitness_values);
    Fitness_Percentages=fitness_values./Total_Fitness;

    for jj=1:Parent_Size
        Roulette_Pin=round(rand(1)*100);
        Sumation=0;
        for ii=1:length(Fitness_Percentages)
           Sumation=Sumation+Fitness_Percentages(ii);
           if Roulette_Pin<=Sumation 
              Selection_of_Parents(jj,:,generation_index)=Population(ii,:,generation_index);
           end
        end  

    end

end

end