clear all
date = datestr(today('datetime'));
type = "both"; %only elliptical or parabolical
dimension_plane = "vertical"; %only vertical or horizontal
name = date + "_" + type + "_" + dimension_plane + "_scan";
fig_name = 'm_sides_nose_guide_scan';

m_diap = 1:0.2:7;
m_str_x_diap = 7;
m_str_y_diap = 7;
mx_diap = 7;
my_diap = m_diap;
source_lambda_min = 0.5;
source_lambda_max = 1;

model = mccode('NERA_guide_3x3_sample_m_scan.instr','mpi=4;ncount=1e7');
%parabola;h=0.2,l=20,lout=0.65
parameters.sample_size=0.03;
parameters.source_lambda_min=source_lambda_min;
parameters.source_lambda_max=source_lambda_max;

parameters.focusing_length = 20;
parameters.guide_shape = 0;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.louth = 0.65;
parameters.linh = 0;
parameters.linw = 0;
parameters.loutw = 0;
parameters.m_str_x = m_str_x_diap;
parameters.m_str_y = m_str_y_diap;
parameters.mx = mx_diap;
parameters.my = my_diap;


results = iData(model, parameters);

dat_m(:,1) = m_diap;

for i = 1:length(m_diap)
    dat_m(i,2) = results(i).UserData.monitors(5).Data.values(1);
end



clear parameters
clear model

model = mccode('NERA_guide_3x3_sample_m_scan.instr','mpi=4;ncount=1e7');
%elliptic;h=0.2,l=22,linh=44.68,louth=0.52
parameters.sample_size=0.03;
parameters.source_lambda_min=source_lambda_min;
parameters.source_lambda_max=source_lambda_max;

parameters.focusing_length = 22;
parameters.guide_shape = 1;
parameters.guide_height = 0.2;
parameters.guide_width = 0.15;
parameters.linh = 44.68;
parameters.louth = 0.52;
parameters.linw = 0;
parameters.loutw = 0;
parameters.m_str_x = m_str_x_diap;
parameters.m_str_y = m_str_y_diap;
parameters.mx = mx_diap;
parameters.my = my_diap;

results = iData(model, parameters);

for i = 1:length(m_diap)
    dat_m(i,3) = results(i).UserData.monitors(5).Data.values(1);
end

% model = mccode('NERA_guide_3x3_sample_m_scan.instr','mpi=4;ncount=1e7');
% %straight
% parameters.sample_size=0.03;
% parameters.source_lambda_min=source_lambda_min;
% parameters.source_lambda_max=source_lambda_max;
% 
% parameters.focusing_length = 0.001;
% parameters.guide_shape = 0;
% parameters.guide_height = 0.2;
% parameters.guide_width = 0.15;
% parameters.louth = 0;
% parameters.linh = 0;
% parameters.linw = 0;
% parameters.loutw = 0;
% parameters.m_str_x = m_str_x_diap;
% parameters.m_str_y = m_str_y_diap;
% parameters.mx = mx_diap;
% parameters.my = my_diap;
% 
% 
% results = iData(model, parameters);
% 
% for i = 1:length(m_diap)
%     dat_m(i,4) = results(i).UserData.monitors(5).Data.values(1);
% end

fig = figure;
set(fig,'Color','White');
plot(dat_m(:,1),dat_m(:,2),dat_m(:,1),dat_m(:,3),'LineWidth',2)
hold on
grid on
xlabel('m')
ylabel('I, arb.u.')
legend('parabolic guide','elliptic guide')
title(fig_name)
legend('Location','southeast')
set(gca, 'FontSize',16);

print(gcf,[char(name) fig_name],'-dpng','-r300')
saveas(gcf,[char(name) fig_name '.fig']);

