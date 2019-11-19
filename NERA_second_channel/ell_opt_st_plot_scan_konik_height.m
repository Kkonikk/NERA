clear all
model = mccode('NERA_guide_ell_st_3part.instr','mpi=6');
fix(model, 'all');
i=1;
name = '20_11_elliptic_height_scan';
height_min = 0.1; height_step = 0.01; height_max = 0.20;
length_min = 5; length_step = 1; length_max = 20;

for length = length_min:length_step:length_max
    j=1;
    for height = height_min:height_step:height_max
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        model.louth = 'free'; model.louth = [0.2 0.5 2];
        model.linh = 'free'; model.linh = [5 90 150];
        model.loutw = 0;
        model.linw = 0;
        %parameters.linh = length+0.35;
        %parameters.louth = 0.35;

        model.guide_height = height;
        model.guide_width = 0.03;
        %model.guide_width = 'free'; model.guide_width = [0.03 0.06 0.3];
        %model.guide_height = 'free'; model.guide_height = [0.03 0.15 0.3];
 
        [parameters, fval, status, output]=fmax(model,[], ...
        'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

        bb = model(parameters,nan);
        ell_param{i,j} = parameters;
        int(i,j) = sum(sum(bb,'double'));
        j=j+1;
    end
    i= i+1;
end
j=1;

sz = size(int);
height = height_min:height_step:height_max;
length = length_min:length_step:length_max;
figure;
for i = 1:sz(2)
    plot(length,int(:,i),'LineWidth',2,'DisplayName',['height =' num2str(height(i))]);
    hold on
    title('scan of different elliptic guides')
    grid on
    xlabel('Length of elliptic guide, m')
    ylabel('I, arb.u.')
    legend
    legend('Location','south')
end

print(gcf,name,'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name '.fig']);
save(name)

