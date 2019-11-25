clear all
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4');
name = '25_11_parab_all';

%vertical plane 
%PV14,l=15,h=0.14,louth=0.99
%PV19,l=20,h=0.19,louth=0.85

%horizontal plane
%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92

parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.ell_length = 15;
parameters.guide_height = 0.14;
parameters.guide_width = 0.15;
parameters.louth = 0.99;

results = iData(model, parameters);
Signal_I = results.UserData.monitors(1).Data.data;
Signal_x = results.UserData.monitors(1).Data.x;

plot(Signal_x,Signal_I,'LineWidth',2)
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend('Profile, parabolic guide')
legend('Location','south')
set(gca, 'FontSize',16);
print(gcf,[name '_x','-dpng','-r300')
saveas(gcf,[name '_x.fig']);

%int = sum(bb,'all');
% 
% sz = size(int);
% height = height_min:height_step:height_max;
% length = length_min:length_step:length_max;
% figure;
% for i = 1:sz(2)
%     plot(length,int(:,i),'LineWidth',2,'DisplayName',['height =' num2str(height(i))]);
%     hold on
%     title('scan of different parabolic guides')
%     grid on
%     xlabel('Length of parabolic guide, m')
%     ylabel('I, arb.u.')
%     legend
%     legend('Location','south')
% end
% set(gca, 'FontSize',16);
% print(gcf,name,'-dpng','-r300')
% saveas(gcf,[name '.fig']);
% 
% fig = figure;
% set(fig,'Color','White');
% plot(height,max(int)/max(max(int)), 'LineWidth',4);
%     grid on
%     title('Parabolic nose height scan')
%     xlabel('Height, m')
%     ylabel('Maximal achievable flux, a.u.')
% set(gca, 'FontSize',16);
% print(gcf,[name '_max'],'-dpng','-r300')
% saveas(gcf,[name '_max' '.fig']);
% 
% 
% fig = figure;
% set(fig,'Color','White');
% t = histogram(right_foc);
%     title('Right focus distribution')
%     xlabel('Right focus position, m')
%     ylabel('Number')
% set(gca, 'FontSize',16);
% 
% 
% right_foc_max = max(max(right_foc));
% right_foc_min = min(min(right_foc));
% 
% save(name);
