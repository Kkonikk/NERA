model = mccode('NERA_guide_3x3_sample_m_scan3.instr','mpi=8;ncount=1e7');
j = 1;
for m = 1:0.5:6
    
    output_ell_hor_ideal.parsBest_struct.m_hor = m;
    output_ell_hor_ideal.parsBest_struct.m_vert = 7;
    output_ell_hor_ideal.parsBest_struct.guide_height = 0.2;
    param = output_ell_hor_ideal.parsBest_struct;
    results = iData(model,param);
    flux(1,j) = results.UserData.monitors.Data.values(1);
    clear param

    output_ell_vert_ideal.parsBest_struct.m_hor = 7;
    output_ell_vert_ideal.parsBest_struct.m_vert = m;
    output_ell_vert_ideal.parsBest_struct.guide_width = 0.2;
    param = output_ell_vert_ideal.parsBest_struct;
    results = iData(model,param);
    flux(2,j) = results.UserData.monitors.Data.values(1);
    clear param

    output_par_hor_ideal.parsBest_struct.m_hor = m;
    output_par_hor_ideal.parsBest_struct.m_vert = 7;
    output_par_hor_ideal.parsBest_struct.guide_height = 0.2;
    param = output_par_hor_ideal.parsBest_struct;
    results = iData(model,param);
    flux(3,j) = results.UserData.monitors.Data.values(1);
    clear param

    output_par_vert_ideal.parsBest_struct.m_hor = 7;
    output_par_vert_ideal.parsBest_struct.m_vert = m;
    output_par_vert_ideal.parsBest_struct.guide_width = 0.2;
    param = output_par_vert_ideal.parsBest_struct;
    results = iData(model,param);
    flux(4,j) = results.UserData.monitors.Data.values(1);
    clear param
    j = j + 1;

end

m_v = 1:0.5:6;
clear fig
fig = figure;
set(fig,'Color','White');

plot(m_v,flux(1,:),'LineWidth',2,'DisplayName','elliptical, horizontal, ideal')
hold on
grid on
xlabel('m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(m_v,flux(2,:),'LineWidth',2,'DisplayName','elliptical, vertical, ideal')
hold on
grid on
xlabel('m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(m_v,flux(3,:),'LineWidth',2,'DisplayName','parabolical, horizontal, ideal')
hold on
grid on
xlabel('m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);

plot(m_v,flux(4,:),'LineWidth',2,'DisplayName','parabolical, vertical, ideal')
hold on
grid on
xlabel('m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);



print(gcf,'compare_ideal_28_09_2','-dpng','-r300')
saveas(gcf,'compare_ideal_28_09_2.fig');



