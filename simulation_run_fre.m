%run simulation for all combinations of the interactions with various
%proportions
clc;
clear;
P_C=(0.1:0.1:1);

for count_C=1:length(P_C)
    P_c=P_C(count_C);
    P_M=(0:0.1:1-P_c);
    for count_M=1:length(P_M)
        P_m=P_M(count_M);
        for time=1:1000
             run('processfre.m');%
            save(['./result_fre/C=',num2str(P_c*10),'M=',num2str(P_m*10),'time=',num2str(time),'rand.mat'],...
                'matrix_c','matrix_m','matrix_p','beta','biomass','biomass_all','name_species','initial_persistence',...
                'initial_prevalence','shannon_diversity','C_');%save as file for drawing figures further.
        end
    end
end

