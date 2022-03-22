# How Multiple Interaction Types Affect Disease and Dilution Effect.

All the \*.m files can be run with matlab, meanwhile, make sure your computer has installed python 3.8 and cooresponing liblaries required in \*.py file, and add Python to the PATH environmental variable, because those \*.py files should be ran by matlab function "system" in \*.m files.

## the ode function

"model_ode_den.m" is the ode45 function in matlab, which describes the dd-transmission model in main text.

"model_ode_fre.m" is the ode45 function in matlab, which describes the fd-transmission model in main text.

## the process*.m file
"process_example_den.m" is an example of the main process of dd-transmission disease spreads in the network with a specific interaction types and proportions.

"process_exampl_fre.m" is an example of the main process of fd-transmission disease spreads in the network with a specific interaction types and proportions.

Change the following parameters in process*.m file can study the dynamic of community with specific interaction proportions:
`P_m`:fraction of mutualistic interaction in food-web; 

`p_c`:fraction of competitive  interaction in food-web.

All parameters in model are difined in those files, and we can obtain the results when the programs finished. 


During our simulation, "process_den.m" is supposed to be run by the file named "simulation_run_den.m" for all possible proportions of interaction for dd-transmision disease.Correspondingly, "process_fre.m" is supposed to be run by the file named "simulation_run_fre.m" for all possible proportions of interaction for fd-transmision for disease. Their parameters `Pc`, `Pm` come from "simulation_run\*.m" by "for-end" structure.

## the simulation_run_\*.m file

To study results of network with the all possible(55) sets of proprotion of interactions, run "preocess*.m" with all sets in "simulation_run_\*.m";
in the maintext, we ran 1000 replicates for each interaction proportion sets, totally $55\times 1000=55000$results.


"simulation_run_den.m" -- dd-transmssion mode


"simulation_run_fre.m" -- fd-transmssion mode

Run this two "simulate_run_\*.m" file with matlab, and we start our simulation here.

Through those "simulate_run_\*.m"file, all results of replicates are saved as "\*.mat" file with specific name in folders named "result_\*".

## the readdata_\*.m
When the two "simulate_run_\*.m" finished, we can execute the two "readdata_\*.m" in matlab to settle all results in folders named "result_\*", and gain "den.mat" and "fre.mat", which contain all the variables to create figures.


## example folder
We provide the triangle plot and violinplot codes, which can be run with python 3.8.

The data("den.mat" or "fre.mat") come from the results generate from "readdata_\*.m"file
