clear all
model = mccode('NERA_guide_ell_st_3part_parabol.instr','mpi=6');
fix(model, 'all');
i=1;
width_min = 0.1; width_step = 0.01; width_max = 0.2;
length_min = 2.5; length_step = 2.5; length_max = 30;

for length = length_min:length_step:length_max
    j=1;
    for width = width_min:width_step:width_max
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        model.louth = 0;
        model.loutw = 'free'; model.loutw = [0 0.35 6];

        model.guide_height = 0.2;
        model.guide_width = width;

        [parameters, fval, status, output]=fmax(model,[], ...
        'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=70', nan);

        bb = model(parameters,nan);
		%не забудь изменить свою функцию в sum
        int(i,j) = sum(bb,'all');
        j=j+1;
    end
    i= i+1;
end
j=1;

sz = size(int);
width = width_min:width_step:width_max;
length = length_min:length_step:length_max;
name = 'parabol_';
figure;
for i = 1:sz(2)
    plot(length,int(:,i),'LineWidth',2,'DisplayName',['width =' num2str(width(i))]);
    hold on
    title('scan of different parabolic guides')
    grid on
    xlabel('Length of parabolic guide, m')
    ylabel('I, arb.u.')
    legend
    legend('Location','south')
end

print(gcf,[name 'scan_width_more_precise'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name 'scan_width_more_precise.fig']);
