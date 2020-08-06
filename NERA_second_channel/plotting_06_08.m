load('parabola_m_2_hor_05_08.mat')
model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
output.parsBest_struct.m = 2;
param = output.parsBest_struct;
results = iData(model,param);
Signal_all{1,1} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};
clear output
clear param

load('parabola_m_25_hor_05_08.mat')
model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
output.parsBest_struct.m = 2.5;
param = output.parsBest_struct;
results = iData(model,param);
Signal_all{1,2} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};
clear output
clear param

load('parabola_m_7_hor_05_08.mat')
model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
output.parsBest_struct.m = 7;
param = output.parsBest_struct;
results = iData(model,param);
Signal_all{1,3} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};
clear output
clear param

load('parabola_m_2_vert_05_08.mat')
model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
output.parsBest_struct.m = 2;
param = output.parsBest_struct;
results = iData(model,param);
Signal_all{1,4} = {'y',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};
clear output
clear param

load('parabola_m_25_vert_05_08.mat')
model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
output.parsBest_struct.m = 2.5;
param = output.parsBest_struct;
results = iData(model,param);
Signal_all{1,5} = {'y',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};
clear output
clear param

load('parabola_m_7_vert_05_08.mat')
model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
output.parsBest_struct.m = 7;
param = output.parsBest_struct;
results = iData(model,param);
Signal_all{1,6} = {'y',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};
clear output
clear param


clear fig
fig = figure;
set(fig,'Color','White');
%plotting y
plot(Signal_all{1,1}{1,2},Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','hor, m = 2')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,2}{1,2},Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','hor, m = 2.5')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,3}{1,2},Signal_all{1,3}{1,3},'LineWidth',2,'DisplayName','hor, m = 7')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

print(gcf,'hor_06_08','-dpng','-r300')
saveas(gcf,'hor_06_08.fig');

clear fig
fig = figure;
set(fig,'Color','White');

plot(Signal_all{1,4}{1,2},Signal_all{1,4}{1,3},'LineWidth',2,'DisplayName','vert, m = 2')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,5}{1,2},Signal_all{1,5}{1,3},'LineWidth',2,'DisplayName','vert, m = 2.5')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,6}{1,2},Signal_all{1,6}{1,3},'LineWidth',2,'DisplayName','vert, m = 7')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);


print(gcf,'vert_06_08','-dpng','-r300')
saveas(gcf,'vert_06_08.fig');



