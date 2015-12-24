    Total_Fitness=sum(fitness);
    Fitness_Percentages=fitness./Total_Fitness;

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