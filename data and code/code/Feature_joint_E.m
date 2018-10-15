
load('./data/all_protein_sequence.mat')
load('./data/all_drug_fingerprints.mat')
 
load('./data/E/bind_orfhsa_drug_e.mat')  
load('./data/E/E_NegativeList.mat')     
load('./data/E/E_P_Trans.mat')     
load('./data/E/E_N_Trans.mat')      



%%%Positive
protein_drug=bind_orfhsa_drug_e;                %%%%%%%%%%%%%
%P_proteinfeature=P_Trans_M;
P_proteinfeature=[];
for i=1:2926      
    aa=P_Trans_M(:,:,i);
    P_proteinfeature(i,:)=aa(:);
end
[P_proteinfeature,PS] = mapminmax(P_proteinfeature,0,1); 
   

P_drugfeature=[];
for i=1:size(protein_drug,1)
    i
    name=protein_drug(i,2);
    name=name{1};
    [x,y] = find(strcmp(all_drug_fingerprints,name));
    F=all_drug_fingerprints(x,2:882);
    F=cell2mat(F);
    P_drugfeature(i,:)=F(:);
end

Positivefeature=[P_proteinfeature P_drugfeature];
bb=zeros(2926,15);   %%%%%%%%%%%%
Positivefeature=[Positivefeature bb];  



%%%Negative
protein_drug=NegativeList;       %%%%%%%%%%%%%
N_proteinfeature=[];
for i=1:2926      
    aa=N_Trans_M(:,:,i);
    N_proteinfeature(i,:)=aa(:);
end
[N_proteinfeature,PS] = mapminmax(N_proteinfeature,0,1);  

N_drugfeature=[];
for i=1:size(protein_drug,1)
    i
    name=protein_drug(i,2);
    name=name{1};
    [x,y] = find(strcmp(all_drug_fingerprints,name));
    F=all_drug_fingerprints(x,2:882);
    F=cell2mat(F);
    N_drugfeature(i,:)=F(:);
end

Negativefeature=[N_proteinfeature N_drugfeature];
Negativefeature=[Negativefeature bb];  

NUM=size(Positivefeature,1);

train_x=[Positivefeature;Negativefeature];
train_y=zeros(NUM*2,10);
train_y(1:NUM,1)=ones(NUM,1);
train_y(NUM+1:NUM*2,2)=ones(NUM,1);
save('./data/E/CNN_Data','train_x','train_y');