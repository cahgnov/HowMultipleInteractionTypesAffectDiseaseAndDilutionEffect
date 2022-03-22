function dydt = model_ode_fre(t,y,n,beta,r,nu,matrix_c,matrix_p,matrix_m,h,delta,rho)
dydt = zeros(2*n,1);
Si=y(1:n);
Ii=y(n+1:end);
H=Si+Ii;
matrix_P1=zeros(n);
matrix_M=zeros(n);
matrix_P1(matrix_p>0)=1;
matrix_M(matrix_m>0)=1;
matrix_P2 = matrix_P1';
%predation term
term_predation=(matrix_P1.*matrix_p)*(H./(h+H));
%prey term
term_prey=(matrix_P2.*matrix_p)*H;
%mutalism term
term_mutualism=(matrix_M.*matrix_m)*(H./(h+H));
sum_C=matrix_c*H;%term of competition

dSi=Si.*(r-delta.*H+sum_C+term_mutualism+term_predation)+...
    (Si./(h+H)).*term_prey-Si.*(beta*(Ii./(H+(H==0))))+rho.*Ii;
dIi=Ii.*(r-delta.*H+sum_C+term_mutualism+term_predation)+...
    (Ii./(h+H)).*term_prey+Si.*(beta*(Ii./(H+(H==0))))+nu.*Ii-rho.*Ii;
dydt(1:n)=dSi;
dydt(n+1:n*2)=dIi;


