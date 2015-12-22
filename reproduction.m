%EE 491 HW4 - ANIL YESILKAYA 
%REPRODUCTION BLOCK
%Aim: To control how the genetic algorithm creates the next generation
%--------------------------------------------------------------------------
%function offspring_VEC = reproduction (population_MTX,N,k,p)
function new_generation = reproduction (parent_VEC,type,k,pop_size)
[parent_size number_of_bits] = size(parent_VEC);
new_generation = zeros(pop_size,number_of_bits);
%Copy parents to next generation
for i=1:parent_size
    new_generation(i,:)=parent_VEC(i,:);
end
offspring_index = parent_size+1;
%--------------------------------------------------------------------------
%=== CROSS-OVER to generate offsprings ====================================
while offspring_index < pop_size
    %select two random parents
    k = randperm(2); 
    parent1 = parent_VEC(k(1),:);
    parent2 = parent_VEC(k(2),:);   
    %Generate two offsprings by one point cross over of the two parents
    parta1=parent1(1:k);  
    partb1=parent1(k+1:number_of_bits);  
    parta2=parent2(1:k);   
    partb2=parent2(k+1:number_of_bits);  
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
end

end
%--------------------------------------------------------------------------