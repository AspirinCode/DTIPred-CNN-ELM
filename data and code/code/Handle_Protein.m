 
[row,col]=size(Pssm_Protein);

for i=1:col
    i

    P=cell2mat(Pssm_Protein(1,i));
    P_trans=P'*P;
    [P_trans,PS] = mapminmax(P_trans,0,1);  
    
    Protein_Mat(i,:)=[P_trans(:)'];   
end
