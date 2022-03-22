% generate csv file which chontians the correlation coeffcients £¬to draw
% violinplot
clear
load('den.mat')
a=1:55;
index=[0,10,19,27,34,40,45,49,52,54,55];
for i=11:-1:2    
    A(i-1,:)=[zeros(1,10-index(i)+index(i-1)),a(index(i-1)+1:index(i))];
end

for zhi=1:10%c=zhi=1
foot_C=A(zhi,zhi:10);
foot_P=A(:,11-zhi);
foot_P=foot_P(1:11-zhi);%p=zhi-1
foot_M=diag(A(1:11-zhi,zhi:10));%m=zhi-1

%¹Ì¶¨C
for i=1:1000
    Cprev_pers(i)=(corrcoef(pers_mat_den(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
    Cprev_conn(i)=(corrcoef(conn_mat_den(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
%     Cprev_nest(i)=(corrcoef(nest(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
%     Cprev_modu(i)=(corrcoef(modu(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
    Cprev_dive(i)=(corrcoef(dive_mat_den(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
    
    Pprev_pers(i)=(corrcoef(pers_mat_den(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
    Pprev_conn(i)=(corrcoef(conn_mat_den(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
%     Pprev_nest(i)=(corrcoef(nest(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
%     Pprev_modu(i)=(corrcoef(modu(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
    Pprev_dive(i)=(corrcoef(dive_mat_den(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
    Mprev_pers(i)=(corrcoef(pers_mat_den(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
    Mprev_conn(i)=(corrcoef(conn_mat_den(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
%     Mprev_nest(i)=(corrcoef(nest(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
%     Mprev_modu(i)=(corrcoef(modu(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
    Mprev_dive(i)=(corrcoef(dive_mat_den(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];

    Cprev_dive(i)=(corrcoef(dive_mat_den(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
    Cprev_conn(i)=(corrcoef(conn_mat_den(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
%     Cprev_nest(i)=(corrcoef(nest(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
%     Cprev_modu(i)=(corrcoef(modu(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
    Cprev_dive(i)=(corrcoef(dive_mat_den(i,foot_C),prev_mat_den(i,foot_C))*[0;1])'*[1;0];
    
    Pprev_dive(i)=(corrcoef(dive_mat_den(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
    Pprev_conn(i)=(corrcoef(conn_mat_den(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
%     Pprev_nest(i)=(corrcoef(nest(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
%     Pprev_modu(i)=(corrcoef(modu(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
    Pprev_dive(i)=(corrcoef(dive_mat_den(i,foot_P),prev_mat_den(i,foot_P))*[0;1])'*[1;0];
    Mprev_dive(i)=(corrcoef(dive_mat_den(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
    Mprev_conn(i)=(corrcoef(conn_mat_den(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
%     Mprev_nest(i)=(corrcoef(nest(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
%     Mprev_modu(i)=(corrcoef(modu(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];
    Mprev_dive(i)=(corrcoef(dive_mat_den(i,foot_M),prev_mat_den(i,foot_M))*[0;1])'*[1;0];

    
end

aver_corr_C(zhi)=mean(Cprev_pers(~(isnan(Cprev_pers))));
aver_corr_M(zhi)=mean(Mprev_pers(~(isnan(Mprev_pers))));
aver_corr_P(zhi)=mean(Pprev_pers(~(isnan(Pprev_pers))));

pers_corr_C(zhi,:)=Cprev_pers;
pers_corr_M(zhi,:)=Mprev_pers;
pers_corr_P(zhi,:)=Pprev_pers;

dive_corr_C(zhi,:)=Cprev_dive;
dive_corr_M(zhi,:)=Mprev_dive;
dive_corr_P(zhi,:)=Pprev_dive;
end
Index=[3,5,7];
Index_=[1,2,3];
prop_index=[0.2,0.4,0.6];
corr_P=[];
corr_M=[];
corr_C=[];
i_corr_P=[];
i_corr_M=[];
i_corr_C=[];
name_cate=[];
for i=Index_
    corr_P=[corr_P,pers_corr_P(Index(i),:),dive_corr_P(Index(i),:)];%p=(0:0.1,0.9)
    corr_C=[corr_C,pers_corr_C(Index(i)-1,:),dive_corr_C(Index(i)-1,:)];%c=(0.1:0.1,1)
    corr_M=[corr_M,pers_corr_M(Index(i),:),dive_corr_M(Index(i),:)];%m=(0:0.1,0.9)

    i_corr_P=[i_corr_P,(prop_index(i))*ones(1,2000)];
    i_corr_M=[i_corr_M,(prop_index(i))*ones(1,2000)];
    i_corr_C=[i_corr_C,prop_index(i)*ones(1,2000)];
    name_cate=[name_cate,repmat("richness-prevalence",1,1000),repmat("diversity-prevalence",1,1000)];
end
% 
% a=boxplot(bar__corr_C(1:5,:)')
corr_P=corr_P';
correlation=corr_P;
i_corr_P=i_corr_P';
constant_P_p=categorical(i_corr_P);
correlationship=name_cate';
bar_date_P=table(correlation,constant_P_p,correlationship);
writetable(bar_date_P,'constant_p.csv')

corr_M=corr_M';
correlation=corr_M;
i_corr_M=i_corr_M';
constant_P_m=categorical(i_corr_M);
correlationship=name_cate';
bar_date_M=table(correlation,constant_P_m,correlationship);
writetable(bar_date_M,'constant_m.csv')

corr_C=corr_C';
correlation=corr_C;
i_corr_C=i_corr_C';
constant_P_c=categorical(i_corr_C);
correlationship=name_cate';
bar_date_C=table(correlation,constant_P_c,correlationship);
writetable(bar_date_C,'constant_c.csv')