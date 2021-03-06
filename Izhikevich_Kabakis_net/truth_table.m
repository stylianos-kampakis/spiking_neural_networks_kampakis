function target_matrices=truth_table(net, input,in_or_out)

%for each input, which neuron is closer

target_matrices=[];
closeness_matrix=[];
if in_or_out==1
regression_matrix=net.regression_matrix;
else
regression_matrix=net.sensor_parameters(:,2);    
end


for i=1:size(input,2)
 for j=1:size(input,1)   
   closeness_matrix=abs(regression_matrix-input(i)*ones(numel(regression_matrix),1));
    
   closeness_matrix(closeness_matrix~=min(closeness_matrix))=Inf;
   closeness_matrix(closeness_matrix==min(closeness_matrix))=1;
    
   closeness_matrix(isinf(closeness_matrix))=0;
   
   if numel(closeness_matrix(closeness_matrix==1))>1
      
       j=numel(closeness_matrix);
       
      while numel(closeness_matrix(closeness_matrix==1))>1
         
          if closeness_matrix(j)==1
          closeness_matrix(j)=0;
          end
          j=j-1;
          
      end
       
   end
   
   target_matrices=[target_matrices closeness_matrix];
    end
end

end