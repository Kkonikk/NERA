clear all
model = mccode('NERA_guide_ell_st_3part_parabol.instr','mpi=6');
fix(model, 'all');
i=1;
name = '23_11_parab_height_scan';
height_min = 0.1; height_step = 0.01; height_max = 0.25;
length_min = 5; length_step = 1; length_max = 25;

for length = length_min:length_step:length_max
    j=1;
    for height = height_min:height_step:height_max
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        model.louth = 'free'; model.louth = [0.1 1 3];
        model.loutw = 0;

        model.guide_height = height;
        model.guide_width = 0.03;

        [parameters, fval, status, output]=fmax(model,[], ...
        'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

        bb = model(parameters,nan);
        parab_param{i,j} = parameters;
	
        int(i,j) = sum(sum(bb,'double'));
	    right_foc(i,j)=parab_param{i,j}(2);
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
    title('Parabolic guide length scan')
    grid on
    xlabel('Length of parabolic guide, m')
    ylabel('Sample flux, arb.u.')
    legend
    legend('Location','southeastoutside')
end
set(gca, 'FontSize',16);
print(gcf,name,'-dpng','-r300')
saveas(gcf,[name '.fig']);

fig = figure;
set(fig,'Color','White');
plot(height,max(int)/max(max(int)), 'LineWidth',4);
    grid on
    title('Parabolic nose height scan')
    xlabel('Height, m')
    ylabel('Maximal achievable sample flux, a.u.')
set(gca, 'FontSize',16);
print(gcf,[name '_max'],'-dpng','-r300')
saveas(gcf,[name '_max' '.fig']);


fig = figure;
set(fig,'Color','White');
t = histogram(right_foc);
    title('Right focus distribution')
    xlabel('Right focus position, m')
    ylabel('Number of configurations')
set(gca, 'FontSize',16);


right_foc_max = max(max(right_foc));
right_foc_min = min(min(right_foc));

save(name);
