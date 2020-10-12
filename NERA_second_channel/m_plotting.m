model = mccode('NERA_guide_3x3_sample_m_scan3.instr','mpi=8;ncount=1e7');
clear flux2
for dim = 1:6
    j = 1;
    for m = 1:0.5:6
        res{2,dim}.parsBest_struct.m_hor = 7;
        res{2,dim}.parsBest_struct.m_vert = m;
        res{2,dim}.parsBest_struct.guide_width = 0.2;
        param = res{2,dim}.parsBest_struct;
        results = iData(model,param);
        flux2(dim,j) = results.UserData.monitors.Data.values(1);
        clear param
        
        j = j + 1;

    end
end-
m_v = 1:0.5:6;
clear fig
fig = figure;
set(fig,'Color','White');
width = 0.12:0.02:0.22;

for dim = 1:6
plot(m_v,flux2(dim,:),'LineWidth',2,'DisplayName',['height = ' char(num2str(width(dim)))])
hold on
grid on
xlabel('m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);
end

print(gcf,'compare_parab_vert_28_09_2','-dpng','-r300')
saveas(gcf,'compare_parab_vert_28_09_2.fig');




