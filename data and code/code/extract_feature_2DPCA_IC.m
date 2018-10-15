 
clear;
load('./data/all_protein_sequence.mat')
load('./data/all_drug_fingerprints.mat')

load('./data/IC/bind_orfhsa_drug_ic.mat')
load('./data/IC/IC_NegativeList.mat')
load('./data/IC/IC_P_Pssm.mat')
load('./data/IC/IC_N_Pssm.mat')

load('./data/IC/IC_P_Trans.mat');     %%%%%%%%%%%%%%%%%%

protein_drug=bind_orfhsa_drug_ic;                %%%%%%%%%%%%%

DataSet=P_Trans_M;  
thresthold=2;    %   thresthold
[allFeature]=PCA_2D(DataSet,thresthold); 

  for i=1:1476       
    S=allFeature(:,:,i);
    E_P_feature(i,:)=S(:);
  end
  
    
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

Positivefeature=[E_P_feature P_drugfeature];


load('./data/IC/IC_N_Trans.mat');     %%%%%%%%%%%%%%%%%%

protein_drug=NegativeList;
N_proteinfeature=[];


DataSet=N_Trans_M;  
thresthold=2;    %   thresthold
[allFeature]=PCA_2D(DataSet,thresthold); 

  for i=1:1476      
    S=allFeature(:,:,i);
    E_N_feature(i,:)=S(:);
  end
  
    
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

Negativefeature=[E_N_feature N_drugfeature];



NUM=size(Positivefeature,1);
DATA=[ones(NUM,1) Positivefeature; -ones(NUM,1) Negativefeature];

Proteinfeaturesize=size(E_N_feature,2);
DATA(:,2:Proteinfeaturesize+1)=[mapminmax(DATA(:,2:Proteinfeaturesize+1)',0,1)]';