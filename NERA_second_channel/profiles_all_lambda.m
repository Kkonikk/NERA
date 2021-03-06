clear all
name_w = '26_11_parab_w';
name_dw = '26_11_parab_dw';
name_h = '26_11_parab_h';
name_dh = '26_11_parab_dh';

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


model = mccode('NERA_guide_parabol_profiles.instr','mpi=4;ncount=1e8');
%PV14,l=15,h=0.14,louth=0.99
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 15;
parameters.guide_height = 0.14;
parameters.guide_width = 0.15;
parameters.louth = 0.99;

results = iData(model, parameters);
Signal_all{1,1} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

clear parameters
clear model
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4;ncount=1e8');
%PV19,l=20,h=0.19,louth=0.85
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 20;
parameters.guide_height = 0.19;
parameters.guide_width = 0.15;
parameters.louth = 0.85;

results = iData(model, parameters);
Signal_all{1,2} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

clear parameters
clear model
model = mccode('NERA_guide_ell_profiles.instr','mpi=4;ncount=1e8');
%EV14,l=14,h=0.14,linh=64.00,louth=0.72
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 14;
parameters.guide_height = 0.14;
parameters.guide_width = 0.15;
parameters.linh = 64;
parameters.louth = 0.72;

results = iData(model, parameters);
Signal_all{1,3} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

clear parameters
clear model
model = mccode('NERA_guide_ell_profiles.instr','mpi=4;ncount=1e8');
%EV19,l=20,h=0.19,linh=138.36,louth=0.63
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 20;
parameters.guide_height = 0.19;
parameters.guide_width = 0.15;
parameters.linh = 138.36;
parameters.louth = 0.63;

results = iData(model, parameters);
Signal_all{1,4} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

%horizontal plane
%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69

clear parameters
clear model
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4;ncount=1e8');
%PH11,l=11,w=0.11,loutw=1.21
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 11;
parameters.guide_height = 0.2;
parameters.guide_width = 0.11;
parameters.loutw = 1.21;

results = iData(model, parameters);
Signal_all{2,1} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

clear parameters
clear model
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4;ncount=1e8');
%PH14,l=14,w=0.14,loutw=0.92
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 14;
parameters.guide_height = 0.2;
parameters.guide_width = 0.14;
parameters.loutw = 0.92;

results = iData(model, parameters);
Signal_all{2,2} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

clear parameters
clear model
model = mccode('NERA_guide_ell_profiles.instr','mpi=4;ncount=1e8');
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 11;
parameters.guide_height = 0.2;
parameters.guide_width = 0.11;
parameters.linw = 45.62;
parameters.loutw = 0.96;

results = iData(model, parameters);
Signal_all{2,3} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};


clear parameters
clear model
model = mccode('NERA_guide_ell_profiles.instr','mpi=4;ncount=1e8');
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.ell_length = 15;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.linw = 122.86;
parameters.loutw = 0.69;

results = iData(model, parameters);
Signal_all{2,4} = {'lambda 0.5-1AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};


%plotting h_lambda
clear fig
fig = figure;
set(fig,'Color','White');
plot(Signal_all{1,1}{1,2},Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','PV14')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,2}{1,2},Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','PV19')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,3}{1,2},Signal_all{1,3}{1,3},'LineWidth',2,'DisplayName','EV14')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,4}{1,2},Signal_all{1,4}{1,3},'LineWidth',2,'DisplayName','EV19')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

print(gcf,[name_h '_lambda_5'],'-dpng','-r300')
saveas(gcf,[name_h '_lambda_5.fig']);


%plotting x_lambda
clear fig
fig = figure;
set(fig,'Color','White');
plot(Signal_all{2,1}{1,2},Signal_all{2,1}{1,3},'LineWidth',2,'DisplayName','PH11')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{2,2}{1,2},Signal_all{2,2}{1,3},'LineWidth',2,'DisplayName','PH14')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{2,3}{1,2},Signal_all{2,3}{1,3},'LineWidth',2,'DisplayName','EH11')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{2,4}{1,2},Signal_all{2,4}{1,3},'LineWidth',2,'DisplayName','EH15')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

print(gcf,[name_w '_lambda_5'],'-dpng','-r300')
saveas(gcf,[name_w '_lambda_5.fig']);
