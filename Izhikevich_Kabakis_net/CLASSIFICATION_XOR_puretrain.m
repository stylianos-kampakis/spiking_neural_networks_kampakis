total_iterations=100;
time=[];
all_success=[];
total_epochs=[];


for iterations=1:total_iterations
options_for_training=pure_train_optionset('Epochs', 100, ...
'Inhibitory','true', ...
'Excitatory','true', ...
'Inhibitory_function','purelin', ...
'Excitatory_function','purelin', ...
'Inhibitory_momentum',0.1, ...
'Excitatory_momentum',0.1, ...
'Inhibitory_momentum_degradation',0, ...
'Excitatory_momentum_degradation',0, ...
'Inhibitory_learning_rate',0, ...
'Excitatory_learning_rate',0, ...
'Target_success',0.95, ...
'Randomize_batch','true', ...
'Renew_weights','false',...
'Epochs_for_renewal',10,...
'Report','false');

disp(['Test number: ' num2str(iterations)])
options=izknet_optionset('Positive_initialization','true');

net_XOR=izknet([2 1],izknet_optionset);
tic
[net_XOR,~, success]=pure_train_izknet4(net_XOR,[0 1 1 0;1 0 1 0],[1 1 0 0],options_for_training,[2 1],options);
time=[time toc];
all_success=[all_success success(numel(success))];
total_epochs=[total_epochs numel(success)];


end


correct=sum(all_success==1)
correct_percentage=correct/total_iterations
false=numel(all_success)-correct
meantotal_epochs=mean(total_epochs)
meanall_success=mean(all_success)
meantime=mean(time)