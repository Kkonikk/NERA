clear flux
model = mccode('NERA_guide_3x3_sample_m_scan3.instr','mpi=8;ncount=1e8');


output_ell_hor_ideal.parsBest_struct.m_hor = 6;
output_ell_hor_ideal.parsBest_struct.m_vert = 6;
output_ell_hor_ideal.parsBest_struct.guide_height = 0.2;
param = output_ell_hor_ideal.parsBest_struct;
results = iData(model,param);
flux{1,1} = results.UserData.monitors(1).Data.data;
flux{2,1} = results.UserData.monitors(1).Data.x;
clear param

output_ell_vert_ideal.parsBest_struct.m_hor = 6;
output_ell_vert_ideal.parsBest_struct.m_vert = 3;
output_ell_vert_ideal.parsBest_struct.guide_width = 0.2;
param = output_ell_vert_ideal.parsBest_struct;
results = iData(model,param);
flux{1,2} = results.UserData.monitors(2).Data.data;
flux{2,2} = results.UserData.monitors(2).Data.x;
clear param

output_par_hor_ideal.parsBest_struct.m_hor = 3;
output_par_hor_ideal.parsBest_struct.m_vert = 6;
output_par_hor_ideal.parsBest_struct.guide_height = 0.2;
param = output_par_hor_ideal.parsBest_struct;
results = iData(model,param);
flux{1,3} = results.UserData.monitors(1).Data.data;
flux{2,3} = results.UserData.monitors(1).Data.x;
clear param

output_par_vert_ideal.parsBest_struct.m_hor = 6;
output_par_vert_ideal.parsBest_struct.m_vert = 3;
output_par_vert_ideal.parsBest_struct.guide_width = 0.2;
param = output_par_vert_ideal.parsBest_struct;
results = iData(model,param);
flux{1,4} = results.UserData.monitors(2).Data.data;
flux{2,4} = results.UserData.monitors(2).Data.x;
clear param

close all
plot(flux{2,1},flux{1,1},'LineWidth',2,'DisplayName','elliptical, horizontal')
hold on
grid on
xlabel('divergence, deg')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(flux{2,2},flux{1,2},'LineWidth',2,'DisplayName','elliptical, vertical')
hold on
grid on
xlabel('divergence, deg')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(flux{2,3},flux{1,3},'LineWidth',2,'DisplayName','parabolical, horizontal')
hold on
grid on
xlabel('divergence, deg')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(flux{2,4},flux{1,4},'LineWidth',2,'DisplayName','parabolical, vertical')
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



