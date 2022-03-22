import numpy as np
from scipy.stats import halfnorm
import scipy.io
import sys
Pc= float(sys.argv[1])
Pm= float(sys.argv[2])
sigma_beta=float(sys.argv[3])
S=50
C=0.5
sigma=0.2
K=100
strengthdist=halfnorm(scale=sigma)
strengthdist_comp=halfnorm(scale=sigma/K)
strengthdist_beta=halfnorm(scale=sigma_beta)
A = np.zeros((S,S)) # uninitialized S by S interaction matrix, a_ij is j's effect on i
A_c = np.zeros((S,S)) # uninitialized interaction matrix with competitive terms only
A_m = np.zeros((S,S))  # uninitialized interaction matrix with mutualistic terms only
A_e= np.zeros((S,S))  # uninitialized interaction matrix with positive exploitative terms only

for i in range(0,S):
            for j in range(i+1,S): # shouldn't be range(i,S) since j and i shouldn't be equal
                if np.random.uniform(0,1) <= C: # then there is an interaction between i and j
                    randnum = np.random.uniform(0,1)
                    if randnum >= (1-Pm): # then mutualistic interaction
                        # inverse transform sampling: use percent point fxn of the half normal
                        aij = strengthdist.ppf(np.random.uniform(0,1)) # interaction strength
                        aji = strengthdist.ppf(np.random.uniform(0,1)) # not necessarily symmetric

                        A_m[i,j] = aij
                        A_m[j,i] = aji

                    elif randnum <= Pc: # then competitive interaction
                        aij = -1 * strengthdist_comp.ppf(np.random.uniform(0,1))
                        aji = -1 * strengthdist_comp.ppf(np.random.uniform(0,1))

                        A_c[i,j] = aij
                        A_c[j,i] = aji

                    else: # exploitative interaction
                        if np.random.uniform(0,1) <= 0.5: # i benefits, j suffers
                            aij = strengthdist.ppf(np.random.uniform(0,1))
                            aji = -1 * aij
                            A_e[i,j] = aij
                            A_e[j,i] = aji

                        else: # i suffers, j benefits
                            aij = -1 * strengthdist.ppf(np.random.uniform(0,1))
                            aji = -1*aij

                            A_e[i,j] = aij
                            A_e[j,i] = aji
beta=strengthdist_beta.ppf(np.random.uniform(0,1,(S,S)))
scipy.io.savemat('result.mat',mdict={'matrix_c':A_c,'matrix_m':A_m,'matrix_p':A_e,'beta':beta})#save as matlab file to be loaded for further simulation.
