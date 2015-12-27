%EE 491 HW4 - ANIL YESILKAYA 
%REPRODUCTION BLOCK
%Aim: To control how the genetic algorithm creates the next generation
%--------------------------------------------------------------------------
%function offspring_VEC = reproduction (population_MTX,N,k,p)
function new_generation = reproduction (parent_VEC,Crossover_type,Crossover_rate,pop_size,parents_fitness,Parents_Elitism,Parents_selection_method,max_min)
[parent_size,number_of_bits] = size(parent_VEC);
new_generation = zeros(pop_size,number_of_bits);

if Parents_Elitism==1
    %Copy parents to next generation
    for i=1:parent_size
        new_generation(i,:)=parent_VEC(i,:);
    end
    offspring_index = parent_size+1;
else
    offspring_index=1;
end
%--------------------------------------------------------------------------
%=== CROSS-OVER to generate offsprings ====================================
while offspring_index < pop_size
    if Parents_selection_method == 1
        %select two random parents
        i = randperm(parent_size); 
        parent1 = parent_VEC(i(1),:);
        parent2 = parent_VEC(i(2),:);
    elseif Parents_selection_method == 2
        %select two parents by roulette_wheel_selection
        parents = roulette_select(parents_fitness,parent_VEC,2,max_min);
        parent1 = parents(1,:);
        parent2 = parents(2,:);
    end

    crossover_rnd=rand();
    if crossover_rnd<Crossover_rate 
        % Generate offsprings of two parents
        switch Crossover_type 
            case {'default','Default'}
            %Generate two offsprings by _one point cross over_ 
            k=round(number_of_bits*Crossover_rate);
            parta1=parent1(1:k);  
            partb1=parent1(k+1:end);  
            parta2=parent2(1:k);   
            partb2=parent2(k+1:end);  
            offspring1=[parta2 partb1];
            offspring2=[parta1 partb2];    
            new_generation(offspring_index,:)=offspring1;
            offspring_index=offspring_index+1;
            if offspring_index>pop_size
                break;
            end
            new_generation(offspring_index,:)=offspring2;
            offspring_index=offspring_index+1;
            if offspring_index>pop_size
                break;
            end
        
        
        case {'2points','2-points'}
        %Add twopointCrossover here
        %Two points cross-over (3 locus interchanges)
        % m and n are the cross-over cut points generated randomly
        cutpoints=randperm(number_of_bits);
        cutpoints=sort(cutpoints(1:2));
        m=cutpoints(1);
        n=cutpoints(2);
        partA1=parent1(1:m);
        partA2=parent1(m+1:n);
        partA3=parent1(n+1:end);
        
        partB1=parent2(1:m);
        partB2=parent2(m+1:n);
        partB3=parent2(n+1:end);
        
        offspring1=[partA1 partB2 partA3];
        offspring2=[partB1 partA2 partB3];
        
        new_generation(offspring_index,:)=offspring1;
            offspring_index=offspring_index+1;
            if offspring_index>pop_size
                break;
            end
            new_generation(offspring_index,:)=offspring2;
            offspring_index=offspring_index+1;
            if offspring_index>pop_size
                break;
            end
            
      
        
       otherwise
        %Copy Parent as next offspring (without changing)
        new_generation(offspring_index,:)=parent1;
        offspring_index=offspring_index+1;
        end 
        
    end
end

end
%--------------------------------------------------------------------------