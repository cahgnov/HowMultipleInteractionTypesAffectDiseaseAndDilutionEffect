# How Multiple Interaction Types affect disease and dilution effect.

all the \*.m files can be run with matlab, meanwhile, make sure your computer has installed python 3.8 and cooresponing liblaries required in \*.py file, and add Python to the PATH environmental variable, because those \*.py files are run by matlab function "system" in \*.m files, 

## the ode function
"model_ode_den.m" is the ode45 function in matlab, which describes the dd model in maintext.
"model_ode_fre.m" is the ode45 function in matlab, which describes the fd model in maintext.

## the process*.m file
"process_example_den.m" is a example of the main process of dd-transmission disease spread in the network with different interaction types and proportion.
"process_exampl_fre.m" is  a example of the main process of fd-transmission disease spread in the network with different interaction types and proportion.

you can change the following parameters in process*.m file to study the dynamic of community which specific interaction proportion:
`P_m`:fraction of mutualistic interaction in food-web; `p_c`:fraction of competitive  interaction in food-web.

we define the all parameters in model in this file; and the file can return a series of variables in matlab.
"process_den.m" is run by the file named "simulation_run_den.m" for all possible proportions of interaction for dd-transmision disease.
correspondily, "process_fre.m" is run by the file named "simulation_run_fre.m" for all possible proportions of interaction for fd-transmision for disease.
## the simulation_run_\*.m file
to study result of network with the all possible(55) sets of proprotion of interactions, run "preocess*.m" with all sets in "simulation_run_\*.m";
in the maintext, we run 1000 replicates for each interaction proportion sets, totally $55\times 1000=55000$results.
"simulation_run_den.m" -- dd-transmssion mode
"simulation_run_fre.m" -- fd-transmssion mode

we can ran this two "simulate_run_\*m" file with matlab, to begain our simulation.
through those "simulate_run_\*m"file, all results of replicates were saved as "\*.mat" file with specific name in folders named "result_\*".

## the readname_\*.m
when the two "simulate_run_\*.m" finished, we can execute the two "readname_\*.m" in matlab to settle all results in folders named "result_\*", and gain "den.mat" and "fre.mat", which contain all the variables to create figures.


## example folder
we provide the triangle plot and violinplot codes, which can be run with python 3.8.
all the data("den.mat" or "fre.mat") come from the result produced from "readname_\*.m"file
