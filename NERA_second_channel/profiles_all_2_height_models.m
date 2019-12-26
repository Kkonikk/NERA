clear all
date = datestr(today('datetime'));
type = "both"; %only elliptical or parabolical
dimension_plane = "vertical"; %only vertical or horizontal
name = date + "_" + type + "_" + dimension_plane + "_scan";

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
parameters.linh = 0;
parameters.linw = 0;
parameters.loutw = 0;

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
parameters.linw = 0;
parameters.loutw = 0;

results = iData(model, parameters);
Signal_all{1,2} = {'y',results.UserData.monitors(3).Data.x,results.UserData.monitors(3).Data.data;...
    'dy',results.UserData.monitors(4).Data.x,results.UserData.monitors(4).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};

clear parameters
clear model

model = mccode('NERA_guide_profiles.instr','mpi=4;ncount=1e8');
%straight
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.focusing_length = 0.001;
parameters.guide_shape = 0;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.louth = 0;
parameters.linh = 0;
parameters.linw = 0;
parameters.loutw = 0;


results = iData(model, parameters);
Signal_all{1,3} = {'y',results.UserData.monitors(3).Data.x,results.UserData.monitors(3).Data.data;...
    'dy',results.UserData.monitors(4).Data.x,results.UserData.monitors(4).Data.data;'lambda 0.5-1AA',results.UserData.monitors(5).Data.x,results.UserData.monitors(5).Data.data};


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

plot(Signal_all{1,2}{1,2},Signal_all{1,3}{1,3},'LineWidth',2,'DisplayName','straight guide')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

print(gcf,[char(name) '_h'],'-dpng','-r300')
saveas(gcf,[char(name) '_h.fig']);


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

plot(Signal_all{1,2}{2,2},Signal_all{1,3}{2,3},'LineWidth',2,'DisplayName','straight guide')
hold on
grid on
xlabel('vertical divergence, deg')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

print(gcf,[char(name) '_hdiv'],'-dpng','-r300')
saveas(gcf,[char(name) '_hdiv.fig']);


%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69

