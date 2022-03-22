%process of simulation for a community with dd-transimission
%make sure that your computer have installed python3.8, and
%add it into environment variables in your computer system
clc;
clear;
%% parameter
num_species=50;%size of the oritical community
h=30;%half-saturation  constant
n=num_species;
P_m=0.4;%fraction of mutualistic interaction in food-web
P_c=0.2;%fraction of competitive interaction in food-web
P_p=1-P_m-P_c;%fraction of predatory interaction in food-web
nu=ones(n,1)-0.95;%Virulence rate
rho=ones(n,1)-0.95;%recovery rate
r=ones(n,1);%instrinsic growth rate
C=0.5;%connectedness
Pr=C;%probability of a interaction occurs between i and j
K=100;%carrying capacity
delta=0.02;%self regulation
sigma_2=0.2;%adjust strength of predation/mutualism, generates random values from half-norm distribution with variance equals sigma_2
sigma_1=sigma_2/K;%adjust strength of competition,
sigma_3=0.001;%adjust strength of infectious ability,
command = ['py interaction_strength.py ',num2str(P_c),' ',num2str(P_m),' ',num2str(sigma_3)];
system(command)%generate interaction matrices matrix_c,matrix_p,matrix_m
load('result.mat')
delete ('result.mat')
beta=beta.*abs(matrix_c+matrix_p+matrix_m+delta*diag(ones(n,1)));%transmision matrix, beta_{i,j} represents the rate species j infect i.

%% simulation
tspan = [0 1000];%steps of simulation
y0=rand(n*2,1)*10;%initial population of each species is randomly drawn from uniform distribution.
options=odeset('Abstol',1e-6,'NonNegative',1:2*n);
[t,y]=ode45(@(t,y) model_ode_den(t,y,n,beta,r,nu,matrix_c,matrix_p,matrix_m,h,delta,rho),tspan,y0,options);
biomass_min = 0.1;
biomass=reshape(sum(y(end-51:end,:))/50,50,2);
biomass_all=sum(biomass,2)';
biomass_all(biomass_all<biomass_min)=0;%H
biomass(:,1)=(biomass(:,1)'.*(biomass_all~=0))';%column 1 represent Si for each species
biomass(:,2)=(biomass(:,2)'.*(biomass_all~=0))';%column 2 represent Si for each species
name_species=(1:50).*(biomass_all~=0);
initial_persistence=sum(name_species>0);%persistence
initial_prevalence=sum(biomass(:,2))/sum(biomass_all);%prevalence
biomass_prop=(biomass_all/sum(biomass_all));
biomass_prop_log=log(biomass_prop(name_species>0));
shannon_diversity=-1*biomass_prop(name_species>0)*(biomass_prop_log');%shannon diversity index
link_mat=matrix_c+matrix_p+matrix_m;
link_mat=link_mat.*repmat((name_species~=0)',1,50);
link_mat=link_mat.*repmat(name_species~=0,50,1);
C_=0.5*sum(sum(link_mat~=0))/(initial_persistence^2);
