clear all
model = mccode('NERA_guide_ell_st_3part.instr','mpi=6');
fix(model, 'all');
i=1;
for length = 1:5:81
    j=1;
    for width = 0.08:0.04:0.16
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        model.loutw = 'free'; model.loutw = [0 0.38 5];
        model.linw = 'free'; model.linw = [0 12.3 50];
        model.louth = 0;
        model.linh = 0;
        %parameters.linh = length+0.35;
        %parameters.louth = 0.35;

        model.guide_height = 0.2;
        model.guide_width = width;
        %model.guide_width = 'free'; model.guide_width = [0.03 0.06 0.3];
        %model.guide_height = 'free'; model.guide_height = [0.03 0.15 0.3];
 
        [parameters, fval, status, output]=fmax(model,[], ...
        'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=200', nan);

        bb = model(parameters,nan);
        int(i,j) = sum(sum(bb,'double'));
        j=j+1;
    end
    i= i+1;
end
j=1;

sz = size(int);
width = 0.08:0.04:0.16;
length = 1:5:81;
name = 'opt_ell_konik';
figure;
for i = 1:sz(2)
    plot(length,int(:,i),'LineWidth',2,'DisplayName',['width =' num2str(width(i))]);
    hold on
    title(name)
    grid on
    xlabel('Length of elliptic guide, m')
    ylabel('I, arb.u.')
    legend
    legend('Location','south')
end

print(gcf,[name '_scan_width'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name '_scan_width.fig']);