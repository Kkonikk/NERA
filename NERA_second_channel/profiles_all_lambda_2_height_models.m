clear all
date = datestr(today('datetime'));
type = "both"; %only elliptical or parabolical
dimension_plane = "vertical"; %only vertical or horizontal
name = date + "_" + type + "_" + dimension_plane + "_scan";

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

model = mccode('NERA_guide_profiles.instr','mpi=4;ncount=1e8');
%straight
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=4.5;

parameters.focusing_length = 0.001;
parameters.guide_shape = 0;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.louth = 0;
parameters.linh = 0;
parameters.linw = 0;
parameters.loutw = 0;


results = iData(model, parameters);
Signal_all{1,3} = {'lambda 0.5-4.5AA',results.UserData.monitors(6).Data.x,results.UserData.monitors(6).Data.data};

clear parameters
clear model

ki = 2*pi./Signal_all{1,1}{1,2};
Ei = 81.807./Signal_all{1,1}{1,2}.^2;

%plotting I(ki)

clear fig
fig = figure;
set(fig,'Color','White');
plot(ki,Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','parabolic guide')
hold on
grid on
xlabel('k, AA-1')
ylabel('I, arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(ki,Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','elliptical guide')
hold on
grid on
xlabel('k, AA-1')
ylabel('I, arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(ki,Signal_all{1,3}{1,3},'LineWidth',2,'DisplayName','straight guide')
hold on
grid on
xlabel('k, AA-1')
ylabel('I, arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);


print(gcf,[char(name) '_lambda_5_ki'],'-dpng','-r300')
saveas(gcf,[char(name) '_lambda_5_ki.fig']);

%plotting I(Ei)

clear fig
fig = figure;
set(fig,'Color','White');
plot(Ei,Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','parabolic guide')
hold on
grid on
xlabel('Ei, meV')
ylabel('I, arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(Ei,Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','elliptical guide')
hold on
grid on
xlabel('Ei, meV')
ylabel('I, arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(Ei,Signal_all{1,3}{1,3},'LineWidth',2,'DisplayName','straight guide')
hold on
grid on
xlabel('Ei, meV')
ylabel('I, arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);


print(gcf,[char(name) '_lambda_5_Ei'],'-dpng','-r300')
saveas(gcf,[char(name) '_lambda_5_Ei.fig']);

%plotting log(I)(ki)

clear fig
fig = figure;
set(fig,'Color','White');
plot(ki,log10(Signal_all{1,1}{1,3}),'LineWidth',2,'DisplayName','parabolic guide')
hold on
grid on
xlabel('k, AA-1')
ylabel('log(I), arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(ki,log10(Signal_all{1,2}{1,3}),'LineWidth',2,'DisplayName','elliptical guide')
hold on
grid on
xlabel('k, AA-1')
ylabel('log(I), arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(ki,log10(Signal_all{1,3}{1,3}),'LineWidth',2,'DisplayName','straight guide')
hold on
grid on
xlabel('k, AA-1')
ylabel('log(I), arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);


print(gcf,[char(name) '_lambda_5_ki_log'],'-dpng','-r300')
saveas(gcf,[char(name) '_lambda_5_ki_log.fig']);

%plotting log(I)(Ei)


clear fig
fig = figure;
set(fig,'Color','White');
plot(Ei,log10(Signal_all{1,1}{1,3}),'LineWidth',2,'DisplayName','parabolic guide')
hold on
grid on
xlabel('Ei, AA-1')
ylabel('log(I), arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(Ei,log10(Signal_all{1,2}{1,3}),'LineWidth',2,'DisplayName','elliptical guide')
hold on
grid on
xlabel('Ei, meV')
ylabel('log(I), arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);

plot(Ei,log10(Signal_all{1,3}{1,3}),'LineWidth',2,'DisplayName','straight guide')
hold on
grid on
xlabel('Ei, meV')
ylabel('log(I), arb.u.')
legend
legend('Location','northeast')
set(gca, 'FontSize',16);


print(gcf,[char(name) '_lambda_5_Ei_log'],'-dpng','-r300')
saveas(gcf,[char(name) '_lambda_5_Ei_log.fig']);
