function Selection_of_Parents=selection(Selection_Type,Population,Parent_Size,fitness_values,max_min)
    [ population_size bit_lengths generation_index]=size(Population); % population size is N 
                                                                      % bit lengths e.g.: 64
                                                                      % generation_index is nth generation of algorithm
    Selection_of_Parents= zeros(Parent_Size,bit_lengths,1);

    switch Selection_Type
        case 1 % Random Selection
        Random_Parents=randperm(population_size);
        New_Parent_indices=Random_Parents(1:Parent_Size);

        for jj=1:Parent_Size
            Selection_of_Parents(jj,:,generation_index)=Population(New_Parent_indices(jj),:,generation_index);
        end

        case 2; % Roulette Selection
        Selection_of_Parents=roulette_select(fitness_values,Population(:,:,generation_index),Parent_Size,max_min);
        
        otherwise
        disp('Unimplemented selection type !')
    end


end