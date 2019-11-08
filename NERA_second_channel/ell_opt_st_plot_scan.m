clear all
model = mccode('NERA_guide_ell_st_3part.instr','mpi=4');

i=1;
for length = 1:50:101
    j=1;
    for height = 0.01:0.1:0.21
        parameters.sample_size=0.03;
        parameters.source_lambda_min=0.5;
        parameters.source_lambda_max=1;

        parameters.ell_length = length;
        %model.loutw = 'free'; model.loutw = [0 0.38 5];
        %model.linw = 'free'; model.linw = [0 12.3 20];
        parameters.loutw = 0;
        parameters.linw = 0;
        parameters.linh = length+0.35;
        parameters.louth = 0.35;

        parameters.guide_height = height;
        parameters.guide_width = 0.15;
        %model.guide_width = 'free'; model.guide_width = [0.03 0.06 0.3];
        %model.guide_height = 'free'; model.guide_height = [0.03 0.15 0.3];

        
        results = iData(model,parameters);
        sum_s = results.UserData.monitors.Data.values(1);
        int(i,j) = sum_s;
        j=j+1;
    end
    i= i+1;
end
j=1;

sz = size(int);
height = 0.01:0.1:0.21;
length = 1:50:101;
name = 'opt';
figure;
for i = 1:sz(2)
    plot(length,int(:,i),'LineWidth',2,'DisplayName',['height =' num2str(height(i))]);
    hold on
    title(name)
    grid on
    xlabel('Length of elliptic guide, m')
    ylabel('I, arb.u.')
    legend
    legend('Location','south')
end

print(gcf,[name 'ell_scan'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name 'ell_scan.fig']);
