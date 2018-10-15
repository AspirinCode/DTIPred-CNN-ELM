
Trans_M=[];

[PssmM]=load('./data/NR/NR_P_Pssm.mat');           %%%%%%%%%%% 
 
for i=1:90      
TempM1=cell2mat(PssmM.N_A_Pssm(1,i));     %%%%%%%%%%%%
TempM2=TempM1';
Temp_R=TempM2*TempM1;        
 
Trans_M(:,:,i)=Temp_R;          
end
 
save('./data/NR/NR_P_Trans','Trans_M')   
Trans_M=[];

[PssmM]=load('./data/NR/NR_N_Pssm.mat');           %%%%%%%%%%% 
 
for i=1:90      
TempM1=cell2mat(PssmM.N_B_Pssm(1,i));     %%%%%%%%%%%%
TempM2=TempM1';
Temp_R=TempM2*TempM1;        
Trans_M(:,:,i)=Temp_R;          
end
 
save('./data/NR/NR_N_Trans','Trans_M')  