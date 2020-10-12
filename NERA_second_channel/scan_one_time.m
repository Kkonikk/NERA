%dx dy x y

model = mccode('NERA_guide_3x3_sample.instr','mpi=8;ncount=1e8');

param.sample_size=0.03;
param.source_lambda_min=0.5;
param.source_lambda_max=1;

param.guide_shape = 0;

param.guide_width = 0.211;
param.guide_height = 0.1982;
param.focusing_length = 19.9451;
param.linh = 0;
param.louth = 0.6824;
param.linw = 0;
param.loutw = 0;
param.focus_x = 0.6824;
results = iData(model,param);

figure;
plot(results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data,'LineWidth',2)
hold on

model = mccode('t1','mpi=8;ncount=1e8');

param.sample_size=0.01;
param.source_lambda_min=0.5;
param.source_lambda_max=1;

param.guide_shape = 0;

param.guide_width = 0.2;
param.guide_height = 0.1982;
param.focusing_length = 19.9451;
param.linh = 0;
param.louth = 0.265;
param.linw = 0;
param.loutw = 0;
param.focus_x = 0.35;
results = iData(model,param);

plot(results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data,'LineWidth',2)
hold on
grid on
 xlabel('divergence, deg')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

set(gcf,'Position',[100 100 1200 800])

print(gcf,'profiles_all_10_10_sm','-dpng','-r300')
saveas(gcf,'profiles_all_10_10_sm');

% 
% plot(flux{2,1},flux{1,1},'LineWidth',2,'DisplayName','elliptical, horizontal')
% hold on
% grid on
% xlabel('divergence, deg')
% ylabel('I, arb.u.')
% legend
% legend('Location','south')
% set(gca, 'FontSize',16);
% 
% set(gcf,'Position',[100 100 1200 800])
% 
% print(gcf,'profiles_all_10_10_sm','-dpng','-r300')
% saveas(gcf,'profiles_all_10_10_sm');
