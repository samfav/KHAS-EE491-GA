%Function roulette-wheel selection
%inputs: fitnessvalues, population, count, max_min
%outputs: roulette_select
function selection= roulette_select( fitnessvalues, population , count, max_min)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    %Roulette-Wheel selection for Maximization Problem
    MaxFitnessval=max(fitnessvalues);

    if max_min==1
        ScaledFitnessval=1./(1+MaxFitnessval-fitnessvalues);
    elseif max_min==2
        ScaledFitnessval=MaxFitnessval-fitnessvalues;
    end
    Totalsum=sum(ScaledFitnessval);
    Percentages=ScaledFitnessval./Totalsum;

    for jj=1:count
        Roulette_Pin=rand();
        ii=1;
        Sumation=Percentages(ii);
        while Sumation < Roulette_Pin
           ii=ii+1;
           Sumation=Sumation+Percentages(ii);
        end  
        selection(jj,:)=population(ii,:);
    end

end

