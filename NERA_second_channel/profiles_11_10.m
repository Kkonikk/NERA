model = mccode('NERA_guide_3x3_sample_many_monitors.instr','mpi=8;ncount=1e8');

clear parameters
clear results

parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.guide_width = 0.2107;
parameters.guide_height = 0.2;
parameters.focusing_length = 16.9254;

parameters.guide_shape = 0;
parameters.louth = 0;
parameters.linh = 0;
parameters.loutw = 0.6146;
parameters.linw = 0;

results = iData(model,parameters);

% 
% figure;
% plot(results.UserData.monitors(1).Data.x,results.UserData.monitors(1).Data.data,'LineWidth',2)
% grid on
% xlabel('hor.div., deg')
% ylabel('I, arb.u.')
% set(gca, 'FontSize',16);
% set(gcf,'Position',[100 100 1200 800])
% 
% print(gcf,'parab_hor_div','-dpng','-r300')
% saveas(gcf,'parab_hor_div');
% 
% figure;
% plot(results.UserData.monitors(3).Data.x,results.UserData.monitors(3).Data.data,'LineWidth',2)
% grid on
% xlabel('x, m')
% ylabel('I, arb.u.')
% set(gca, 'FontSize',16);
% set(gcf,'Position',[100 100 1200 800])
% 
% print(gcf,'parab_x','-dpng','-r300')
% saveas(gcf,'parab_x');
% 
% model = mccode('NERA_guide_3x3_sample_many_monitors.instr','mpi=8;ncount=1e8');
% 
% clear parameters
% clear results
% 
% parameters.sample_size=0.03;
% parameters.source_lambda_min=0.5;
% parameters.source_lambda_max=1;
% 
% parameters.guide_width = 0.2;
% parameters.guide_height = 0.1982;
% parameters.focusing_length = 19.9451;
% 
% parameters.guide_shape = 0;
% parameters.louth = 0.6824;
% parameters.linh = 0;
% parameters.loutw =0;
% parameters.linw = 0;
% 
% results = iData(model,parameters);
% 
% figure;
% plot(results.UserData.monitors(2).Data.x,results.UserData.monitors(2).Data.data,'LineWidth',2)
% grid on
% xlabel('vert.div., deg')
% ylabel('I, arb.u.')
% set(gca, 'FontSize',16);
% set(gcf,'Position',[100 100 1200 800])
% 
% print(gcf,'parab_vert_div','-dpng','-r300')
% saveas(gcf,'parab_vert_div');
% 
% figure;
% plot(results.UserData.monitors(4).Data.x,results.UserData.monitors(4).Data.data,'LineWidth',2)
% grid on
% xlabel('y, m')
% ylabel('I, arb.u.')
% set(gca, 'FontSize',16);
% set(gcf,'Position',[100 100 1200 800])
% 
% print(gcf,'parab_y','-dpng','-r300')
% saveas(gcf,'parab_y');
