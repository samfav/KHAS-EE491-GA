function Selection_of_Parents=selection(Selection_Type,Population,Parent_Size,fitness_values)
[ population_size bit_lengths generation_index]=size(Population); % population size is N 
                                                                 % bit lengths e.g.: 64
                                                                 % generation_index is nth generation of algorithm
                                                                 
if Selection_Type==1; % Random Selection
    Random_Parents=randperm(population_size);
    New_Parent_indices=Random_Parents(1:Parent_Size);
    Selection_of_Parents= zeros(Parent_Size,bit_lengths,1);
    
    for jj=1:Parent_Size
        Selection_of_Parents(jj,:,generation_index)=Population(New_Parent_indices(jj),:,generation_index);
    end
end   
% elseif Selection_Type==2; % Roulette Selection
%     
% Total_Fitness=sum(fitness_values);
% Fitness_Percentage=fitness_values./Total_Fitness;
% 
% for jj=1:Parent_Size
% Roulette_Pin=round(rand(1)*100);
% counter=1;
% for ii=1:Roulette_Pin
%    if counter==Roulette_Pin
%       Selection_of_Parents(jj,:,generation_index)=Population(jj,:,generation_index);
%    end
%    counter=counter+1;
% end
% 
% else % Hybrid Selection
%     
%     
% end


end