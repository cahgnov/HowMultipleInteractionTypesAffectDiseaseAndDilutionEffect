%各种指标
clear
file_fre=dir('./result/*.mat');
% file_fre=dir('./fre/result/*.mat');
prev_fre=zeros(55000,1);
pers_fre=zeros(55000,1);
for i_file = 1:length(file_fre)
    load(['./result/',file_fre(i_file).name])
    prev_fre(i_file)=initial_prevalence;
    pers_fre(i_file)=initial_persistence;
    bioT_fre(i_file)=sum(biomass_all);
    bioS_fre(i_file)=sum(biomass(:,1));
    bioI_fre(i_file)=sum(biomass(:,2));
    conn_fre(i_file)=C_;
    dive_fre(i_file)=shannon_diversity;
    
    link_mat=(matrix_c~=0)+(matrix_p~=0)+(matrix_m~=0);
degree_init=sum(link_mat);

    link_mat=link_mat.*repmat((name_species~=0)',1,50);
link_mat=link_mat.*repmat(name_species~=0,50,1);
degree=sum(link_mat);%每个species(node)的度数
N=sum((name_species>0));%续存下的节点数=persistence
centrality_fre(i_file,:)=(degree/(N-1)).*(name_species~=0);
prop_m_fre(i_file)=sum(sum(((matrix_m~=0).*repmat((name_species~=0)',1,50)).*repmat(name_species~=0,50,1)))/sum(degree);
prop_c_fre(i_file)=sum(sum(((matrix_c~=0).*repmat((name_species~=0)',1,50)).*repmat(name_species~=0,50,1)))/sum(degree);
prop_p_fre(i_file)=sum(sum(((matrix_p~=0).*repmat((name_species~=0)',1,50)).*repmat(name_species~=0,50,1)))/sum(degree);
prop_m_init_fre(i_file)=sum(sum(matrix_m~=0))/sum(degree_init);
prop_c_init_fre(i_file)=sum(sum(matrix_c~=0))/sum(degree_init);
prop_p_init_fre(i_file)=sum(sum(matrix_p~=0))/sum(degree_init);
prev_species_fre(i_file,:)=(biomass(:,2))'./(biomass_all+(biomass_all==0));

end
prev_fre=prev_fre([1001:55000,1:1000]);
pers_fre=pers_fre([1001:55000,1:1000]);
    bioT_fre=bioT_fre([1001:55000,1:1000]);
    bioS_fre=bioS_fre([1001:55000,1:1000]);
    bioI_fre=bioI_fre([1001:55000,1:1000]);
    conn_fre=conn_fre([1001:55000,1:1000]);
    dive_fre=dive_fre([1001:55000,1:1000]);
prop_m_fre=prop_m_fre([1001:55000,1:1000]);
prop_c_fre=prop_c_fre([1001:55000,1:1000]);
prop_p_fre=prop_p_fre([1001:55000,1:1000]);
prop_m_init_fre=prop_m_init_fre([1001:55000,1:1000]);
prop_c_init_fre=prop_c_init_fre([1001:55000,1:1000]);
prop_p_init_fre=prop_p_init_fre([1001:55000,1:1000]);
centrality_fre=centrality_fre([1001:55000,1:1000],:);
prev_species_fre=prev_species_fre([1001:55000,1:1000],:);


prev_mat_fre=reshape(prev_fre,1000,55);
pers_mat_fre=reshape(pers_fre,1000,55);

    bioT_mat_fre=reshape(bioT_fre,1000,55);
    bioS_mat_fre=reshape(bioS_fre,1000,55);
    bioI_mat_fre=reshape(bioI_fre,1000,55);
    conn_mat_fre=reshape(conn_fre,1000,55);
    dive_mat_fre=reshape(dive_fre,1000,55);
prop_m_mat_fre=reshape(prop_m_fre,1000,55);
prop_c_mat_fre=reshape(prop_c_fre,1000,55);
prop_p_mat_fre=reshape(prop_p_fre,1000,55);
prop_m_mat_init_fre=reshape(prop_m_init_fre,1000,55);
prop_c_mat_init_fre=reshape(prop_c_init_fre,1000,55);
prop_p_mat_init_fre=reshape(prop_p_init_fre,1000,55);

prev_aver_fre=mean(prev_mat_fre);
pers_aver_fre=mean(pers_mat_fre);
    bioT_aver_fre=mean(bioT_mat_fre);
    bioS_aver_fre=mean(bioS_mat_fre);
    bioI_aver_fre=mean(bioI_mat_fre);
    conn_aver_fre=mean(conn_mat_fre);
    dive_aver_fre=mean(dive_mat_fre);
prop_m_aver_fre=mean(prop_m_mat_fre);
prop_c_aver_fre=mean(prop_c_mat_fre);
prop_p_aver_fre=mean(prop_p_mat_fre);
prop_m_aver_init_fre=mean(prop_m_mat_init_fre);
prop_c_aver_init_fre=mean(prop_c_mat_init_fre);
prop_p_aver_init_fre=mean(prop_p_mat_init_fre);