
Trans_M=[];

[PssmM]=load('./data/GPCR/GPCR_P_Pssm.mat');           %%%%%%%%%%% 
 
for i=1:635      
TempM1=cell2mat(PssmM.N_A_Pssm(1,i));     %%%%%%%%%%%%
TempM2=TempM1';
Temp_R=TempM2*TempM1;        
 
Trans_M(:,:,i)=Temp_R;          
end
 
save('./data/GPCR/GPCR_P_Trans','Trans_M')  
Trans_M=[];

[PssmM]=load('./data/GPCR/GPCR_N_Pssm.mat');           %%%%%%%%%%% 
 
for i=1:635      
TempM1=cell2mat(PssmM.N_B_Pssm(1,i));     %%%%%%%%%%%%
TempM2=TempM1';
Temp_R=TempM2*TempM1;        
 
Trans_M(:,:,i)=Temp_R;          
end
 
save('./data/GPCR/GPCR_N_Trans','Trans_M')   