clear all
name_w = '04_12_parab_w';
name_dw = '04_12_parab_dw';
name_h = '04_12_parab_h';
name_dh = '04_12_parab_dh';

%vertical plane 
%PV14,l=15,h=0.14,louth=0.99
%PV19,l=20,h=0.19,louth=0.85
%EV14,l=14,h=0.14,linh=64.00,louth=0.72
%EV19,l=20,h=0.19,linh=138.36,louth=0.63

%horizontal plane
%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69

%vertical_new
%parabola;h=0.2,l=20,louth=0.65
%elliptic;h-0.2,l=22,linh=44.68,louth=0.52

model = mccode('NERA_guide_profiles.instr','mpi=4;ncount=1e8');
%parabola;h=0.2,l=20,lout=0.65
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.focusing_length = 20;
parameters.guide_shape = 0;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.louth = 0.65;

results = iData(model, parameters);
Signal_all{1,1} = {'y',results.UserData.monitors(3).Data.x,results.UserData.monitors(3).Data.data;...
    'dy',results.UserData.monitors(4).Data.x,results.UserData.monitors(4).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};

clear parameters
clear model
model = mccode('NERA_guide_profiles.instr','mpi=4;ncount=1e8');
%elliptic;h=0.2,l=22,linh=44.68,louth=0.52
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.focusing_length = 22;
parameters.guide_shape = 1;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.linh = 44.68;
parameters.louth = 0.52;

results = iData(model, parameters);
Signal_all{1,2} = {'y',results.UserData.monitors(3).Data.x,results.UserData.monitors(3).Data.data;...
    'dy',results.UserData.monitors(4).Data.x,results.UserData.monitors(4).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};

clear parameters
clear model
%horizontal plane
%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69
% 
% clear parameters
% clear model
% model = mccode('NERA_guide_parabol_profiles.instr','mpi=4;ncount=1e8');
% %PH11,l=11,w=0.11,loutw=1.21
% parameters.sample_size=0.03;
% parameters.source_lambda_min=0.5;
% parameters.source_lambda_max=1;
% 
% parameters.ell_length = 11;
% parameters.guide_height = 0.2;
% parameters.guide_width = 0.11;
% parameters.loutw = 1.21;
% 
% results = iData(model, parameters);
% Signal_all{2,1} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data;...
%     'dx',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};
% 
% clear parameters
% clear model
% model = mccode('NERA_guide_parabol_profiles.instr','mpi=4;ncount=1e8');
% %PH14,l=14,w=0.14,loutw=0.92
% parameters.sample_size=0.03;
% parameters.source_lambda_min=0.5;
% parameters.source_lambda_max=1;
% 
% parameters.ell_length = 14;
% parameters.guide_height = 0.2;
% parameters.guide_width = 0.14;
% parameters.loutw = 0.92;
% 
% results = iData(model, parameters);
% Signal_all{2,2} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data;...
%     'dx',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};
% 
% clear parameters
% clear model
% model = mccode('NERA_guide_ell_profiles.instr','mpi=4;ncount=1e8');
% %EH11,l=12,w=0.11,linw=45.62,loutw=0.96
% parameters.sample_size=0.03;
% parameters.source_lambda_min=0.5;
% parameters.source_lambda_max=1;
% 
% parameters.ell_length = 11;
% parameters.guide_height = 0.2;
% parameters.guide_width = 0.11;
% parameters.linw = 45.62;
% parameters.loutw = 0.96;
% 
% results = iData(model, parameters);
% Signal_all{2,3} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data;...
%     'dx',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};
% 
% 
% clear parameters
% clear model
% model = mccode('NERA_guide_ell_profiles.instr','mpi=4;ncount=1e8');
% %EH15,l=15,w=0.15,linw=122.86,loutw=0.69
% parameters.sample_size=0.03;
% parameters.source_lambda_min=0.5;
% parameters.source_lambda_max=1;
% 
% parameters.ell_length = 15;
% parameters.guide_height = 0.2;
% parameters.guide_width = 0.15;
% parameters.linw = 122.86;
% parameters.loutw = 0.69;
% 
% results = iData(model, parameters);
% Signal_all{2,4} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data;...
%     'dx',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};

%vertical plane 
%PV14,l=15,h=0.14,louth=0.99
%PV19,l=20,h=0.19,louth=0.85
%EV14,l=14,h=0.14,linh=64.00,louth=0.72
%EV19,l=20,h=0.19,linh=138.36,louth=0.63

%horizontal plane
%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69

clear fig
fig = figure;
set(fig,'Color','White');
%plotting y
plot(Signal_all{1,1}{1,2},Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','parabolical guide')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,2}{1,2},Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','elliptic guide')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

print(gcf,name_h,'-dpng','-r300')
saveas(gcf,[name_h '.fig']);


%plotting dy
clear fig
fig = figure;
set(fig,'Color','White');
plot(Signal_all{1,1}{2,2},Signal_all{1,1}{2,3},'LineWidth',2,'DisplayName','parabolical guide')
hold on
grid on
xlabel('vertical divergence, deg')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,2}{2,2},Signal_all{1,2}{2,3},'LineWidth',2,'DisplayName','elliptic guide')
hold on
grid on
xlabel('vertical divergence, deg')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

print(gcf,[name_h '_lambda'],'-dpng','-r300')
saveas(gcf,[name_h '_lambda.fig']);


%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69

