clear all
model = mccode('NERA_guide_ell_st_3part_parabol.instr','mpi=6');
fix(model, 'all');
i=1;
height_min = 0.12; height_step = 0.01; height_max = 0.22;
length_min = 2.5; length_step = 2.5; length_max = 30;

for length = length_min:length_step:length_max
    j=1;
    for height = height_min:height_step:height_max
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        model.louth = 'free'; model.louth = [0 0.35 6];
        model.loutw = 0;

        model.guide_height = height;
        model.guide_width = 0.15;

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
height = height_min:height_step:height_max;
length = length_min:length_step:length_max;
name = 'parabol_';
figure;
for i = 1:sz(2)
    plot(length,int(:,i),'LineWidth',2,'DisplayName',['height =' num2str(height(i))]);
    hold on
    title('scan of different parabolic guides')
    grid on
    xlabel('Length of parabolic guide, m')
    ylabel('I, arb.u.')
    legend
    legend('Location','south')
end

print(gcf,[name 'scan_height_more_precise'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name 'scan_height_more_precise.fig']);
