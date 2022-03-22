%各种指标
clear
file_den=dir('./result_den/*.mat');
% file_den=dir('./fre/result/*.mat');
prev_den=zeros(55000,1);
pers_den=zeros(55000,1);
for i_file = 1:length(file_den)
    load(['./result_den/',file_den(i_file).name])
    prev_den(i_file)=initial_prevalence;
    pers_den(i_file)=initial_persistence;
    bioT_den(i_file)=sum(biomass_all);
    bioS_den(i_file)=sum(biomass(:,1));
    bioI_den(i_file)=sum(biomass(:,2));
    conn_den(i_file)=C_;
    dive_den(i_file)=shannon_diversity;
    
    link_mat=(matrix_c~=0)+(matrix_p~=0)+(matrix_m~=0);
    degree_init=sum(link_mat);
    
    link_mat=link_mat.*repmat((name_species~=0)',1,50);
    link_mat=link_mat.*repmat(name_species~=0,50,1);
    degree=sum(link_mat);%每个species(node)的度数
    N=sum((name_species>0));%续存下的节点数=persistence
    centrality_den(i_file,:)=(degree/(N-1)).*(name_species~=0);
    prop_m_den(i_file)=sum(sum(((matrix_m~=0).*repmat((name_species~=0)',1,50)).*repmat(name_species~=0,50,1)))/sum(degree);
    prop_c_den(i_file)=sum(sum(((matrix_c~=0).*repmat((name_species~=0)',1,50)).*repmat(name_species~=0,50,1)))/sum(degree);
    prop_p_den(i_file)=sum(sum(((matrix_p~=0).*repmat((name_species~=0)',1,50)).*repmat(name_species~=0,50,1)))/sum(degree);
    prop_m_init_den(i_file)=sum(sum(matrix_m~=0))/sum(degree_init);
    prop_c_init_den(i_file)=sum(sum(matrix_c~=0))/sum(degree_init);
    prop_p_init_den(i_file)=sum(sum(matrix_p~=0))/sum(degree_init);
    prev_species_den(i_file,:)=(biomass(:,2))'./(biomass_all+(biomass_all==0));
    
end
prev_den=prev_den([1001:55000,1:1000]);
pers_den=pers_den([1001:55000,1:1000]);
bioT_den=bioT_den([1001:55000,1:1000]);
bioS_den=bioS_den([1001:55000,1:1000]);
bioI_den=bioI_den([1001:55000,1:1000]);
conn_den=conn_den([1001:55000,1:1000]);
dive_den=dive_den([1001:55000,1:1000]);
prop_m_den=prop_m_den([1001:55000,1:1000]);
prop_c_den=prop_c_den([1001:55000,1:1000]);
prop_p_den=prop_p_den([1001:55000,1:1000]);
prop_m_init_den=prop_m_init_den([1001:55000,1:1000]);
prop_c_init_den=prop_c_init_den([1001:55000,1:1000]);
prop_p_init_den=prop_p_init_den([1001:55000,1:1000]);
centrality_den=centrality_den([1001:55000,1:1000],:);
prev_species_den=prev_species_den([1001:55000,1:1000],:);


prev_mat_den=reshape(prev_den,1000,55);
pers_mat_den=reshape(pers_den,1000,55);

bioT_mat_den=reshape(bioT_den,1000,55);
bioS_mat_den=reshape(bioS_den,1000,55);
bioI_mat_den=reshape(bioI_den,1000,55);
conn_mat_den=reshape(conn_den,1000,55);
dive_mat_den=reshape(dive_den,1000,55);
prop_m_mat_den=reshape(prop_m_den,1000,55);
prop_c_mat_den=reshape(prop_c_den,1000,55);
prop_p_mat_den=reshape(prop_p_den,1000,55);
prop_m_mat_init_den=reshape(prop_m_init_den,1000,55);
prop_c_mat_init_den=reshape(prop_c_init_den,1000,55);
prop_p_mat_init_den=reshape(prop_p_init_den,1000,55);

prev_aver_den=mean(prev_mat_den);
pers_aver_den=mean(pers_mat_den);
bioT_aver_den=mean(bioT_mat_den);
bioS_aver_den=mean(bioS_mat_den);
bioI_aver_den=mean(bioI_mat_den);
conn_aver_den=mean(conn_mat_den);
dive_aver_den=mean(dive_mat_den);
prop_m_aver_den=mean(prop_m_mat_den);
prop_c_aver_den=mean(prop_c_mat_den);
prop_p_aver_den=mean(prop_p_mat_den);
prop_m_aver_init_den=mean(prop_m_mat_init_den);
prop_c_aver_init_den=mean(prop_c_mat_init_den);
prop_p_aver_init_den=mean(prop_p_mat_init_den);