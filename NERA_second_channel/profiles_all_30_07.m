clear all
date = datestr(today('datetime'));
type = "both"; %only elliptical or parabolical
dimension_plane = "horizontal"; %only vertical or horizontal
name = date + "_" + type + "_" + dimension_plane + "_plots";

%vertical_new
% ell hor 90% 0.15 25
% [28.965424565141404,0.749949430279969]
% ell hor 100% 0.21 23
% [2.477072105925819e+02,0.745606897574260]
% ell vert 90% 0.15 23
% [22.517243756542833,0.783159902810912]
% ell vert 100% 0.2 23
% [1.691363021474024e+02,0.662932755301865]

% par vert 90% 0.15 12
% 0.758905248936704
% par vert 100% 0.2 20
% 0.621093870078619
% par hor 90% 0.17 12
% 0.721925854886902
% par hor 100% 0.21 20
% 0.556665382013832

%1 - x monitor, 2 - y monitor

% HORIZONTAL

% ell hor 90% 0.15 25
% [28.965424565141404,0.749949430279969]
% ell hor 100% 0.21 23
% [2.477072105925819e+02,0.745606897574260]
% par hor 90% 0.17 12
% 0.721925854886902
% par hor 100% 0.21 20
% 0.556665382013832

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% ell hor 90% 0.15 25
% [28.965424565141404,0.749949430279969]
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;


parameters.guide_width = 0.15;
parameters.guide_height = 0.4;
parameters.focusing_length = 25;
parameters.guide_shape = 1;
parameters.linh = 0;
parameters.louth = 0;
parameters.linw = 28.97;
parameters.loutw = 0.75;

results = iData(model, parameters);
Signal_all{1,1} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};

clear parameters
clear model

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% ell hor 100% 0.21 23
% [2.477072105925819e+02,0.745606897574260]
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;


parameters.guide_width = 0.21;
parameters.guide_height = 0.4;
parameters.focusing_length = 23;
parameters.guide_shape = 1;
parameters.linh = 0;
parameters.louth = 0;
parameters.linw = 248;
parameters.loutw = 0.746;

results = iData(model, parameters);
Signal_all{1,2} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};


clear parameters
clear model

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% par hor 90% 0.17 12
% 0.721925854886902
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;


parameters.guide_width = 0.17;
parameters.guide_height = 0.4;
parameters.focusing_length = 12;
parameters.guide_shape = 0;
parameters.louth = 0;
parameters.loutw = 0.72;


results = iData(model, parameters);
Signal_all{1,3} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};

clear parameters
clear model

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% par hor 100% 0.21 20
% 0.556665382013832
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.guide_width = 0.21;
parameters.guide_height = 0.4;
parameters.focusing_length = 20;
parameters.guide_shape = 0;
parameters.louth = 0;
parameters.loutw = 0.56;


results = iData(model, parameters);
Signal_all{1,4} = {'x',results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data};


clear fig
fig = figure;
set(fig,'Color','White');
%plotting y
plot(Signal_all{1,1}{1,2},Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','ell, 90%')
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,2}{1,2},Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','ell, 100%')
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,3}{1,2},Signal_all{1,3}{1,3},'LineWidth',2,'DisplayName','par, 90%')
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,4}{1,2},Signal_all{1,4}{1,3},'LineWidth',2,'DisplayName','par, 100%')
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);


print(gcf,char(name),'-dpng','-r300')
saveas(gcf,[char(name) '.fig']);


clear all
date = datestr(today('datetime'));
type = "both"; %only elliptical or parabolical
dimension_plane = "vertical"; %only vertical or horizontal
name = date + "_" + type + "_" + dimension_plane + "_plots";

% VERTICAL

% ell vert 90% 0.15 23
% [22.517243756542833,0.783159902810912]
% ell vert 100% 0.2 23
% [1.691363021474024e+02,0.662932755301865]
% par vert 90% 0.15 12
% 0.758905248936704
% par vert 100% 0.2 20
% 0.621093870078619

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% ell vert 90% 0.15 23
% [22.517243756542833,0.783159902810912]
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;


parameters.guide_width = 0.4;
parameters.guide_height = 0.15;
parameters.focusing_length = 23;
parameters.guide_shape = 1;
parameters.linh = 22.5;
parameters.louth = 0.783;
parameters.linw = 0;
parameters.loutw = 0;

results = iData(model, parameters);
Signal_all{1,1} = {'y',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data};

clear parameters
clear model

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% ell vert 100% 0.2 23
% [1.691363021474024e+02,0.662932755301865]
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;


parameters.guide_width = 0.4;
parameters.guide_height = 0.2;
parameters.focusing_length = 23;
parameters.guide_shape = 1;
parameters.linh = 169;
parameters.louth = 0.663;
parameters.linw = 0;
parameters.loutw = 0;

results = iData(model, parameters);
Signal_all{1,2} = {'y',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data};


clear parameters
clear model

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% par vert 90% 0.15 12
% 0.758905248936704
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;


parameters.guide_width = 0.4;
parameters.guide_height = 0.15;
parameters.focusing_length = 12;
parameters.guide_shape = 0;
parameters.louth = 0.76;
parameters.loutw = 0;


results = iData(model, parameters);
Signal_all{1,3} = {'y',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data};

clear parameters
clear model

model = mccode('NERA_guide_profiles_20_07.instr','mpi=8;ncount=1e8');
% par vert 100% 0.2 20
% 0.621093870078619
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.guide_width = 0.4;
parameters.guide_height = 0.2;
parameters.focusing_length = 20;
parameters.guide_shape = 0;
parameters.louth = 0.62;
parameters.loutw = 0;


results = iData(model, parameters);
Signal_all{1,4} = {'y',results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data};


clear fig
fig = figure;
set(fig,'Color','White');
%plotting y
plot(Signal_all{1,1}{1,2},Signal_all{1,1}{1,3},'LineWidth',2,'DisplayName','ell, 90%')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,2}{1,2},Signal_all{1,2}{1,3},'LineWidth',2,'DisplayName','ell, 100%')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,3}{1,2},Signal_all{1,3}{1,3},'LineWidth',2,'DisplayName','par, 90%')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(Signal_all{1,4}{1,2},Signal_all{1,4}{1,3},'LineWidth',2,'DisplayName','par, 100%')
hold on
grid on
xlabel('height, m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);


print(gcf,char(name),'-dpng','-r300')
saveas(gcf,[char(name) '.fig']);



