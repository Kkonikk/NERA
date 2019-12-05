clear all
name_w = '04_12_parab_w';
name_dw = '04_12_parab_dw';
name_h = '04_12_parab_h';
name_dh = '04_12_parab_dh';

model = mccode('NERA_guide_profiles.instr','mpi=4;ncount=1e8');
%parabola;h=0.2,l=20,lout=0.65
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.focusing_length = 20;
parameters.guide_shape = 0;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.louth = 0.65;
parameters.linh = 0;
parameters.linw = 0;
parameters.loutw = 0;


results = iData(model, parameters);
Signal_all{1,1} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

clear parameters
clear model

model = mccode('NERA_guide_profiles.instr','mpi=4;ncount=1e8');
%elliptic;h=0.2,l=22,linh=44.68,louth=0.52
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.focusing_length = 22;
parameters.guide_shape = 1;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.linh = 44.68;
parameters.louth = 0.52;
parameters.linw = 0;
parameters.loutw = 0;

results = iData(model, parameters);
Signal_all{1,2} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

%plotting h_lambda
clear fig
fig = figure;
set(fig,'Color','White');
plot(Signal_all{1,1}{1,2},Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','parabolic guide')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,2}{1,2},Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','elliptical guide')
hold on
grid on
xlabel('lambda, AA')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);


print(gcf,[name_w '_lambda_5'],'-dpng','-r300')
saveas(gcf,[name_w '_lambda_5.fig']);
