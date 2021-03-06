clear all
model = mccode('NERA_guide_ell_st_3part.instr','mpi=6');
fix(model, 'all');
i=1;
name = '20_11_elliptic_height_scan';
height_min = 0.1; height_step = 0.01; height_max = 0.25;
length_min = 5; length_step = 1; length_max = 25;

for length = length_min:length_step:length_max
    j=1;
    for height = height_min:height_step:height_max
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        model.louth = 'free'; model.louth = [0.1 0.5 2];
        model.linh = 'free'; model.linh = [5 110 200];
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
        left_foc(i,j)=ell_param{i,j}(2);
        right_foc(i,j)=ell_param{i,j}(3);
        j=j+1;
    end
    i= i+1;
end
j=1;

sz = size(int);
height = height_min:height_step:height_max;
length = length_min:length_step:length_max;
fig = figure;
set(fig,'Color','White');
for i = 1:sz(2)
    plot(length,int(:,i),'LineWidth',2,'DisplayName',['h = ' num2str(height(i))]);
    hold on
    title('Elliptic nose length scan')
    grid on
    xlabel('Length of elliptic guide, m')
    ylabel('Sample flux, arb.u.')
    legend('Location','southeastoutside')
end
set(gca, 'FontSize',16);
print(gcf,name,'-dpng','-r300')
saveas(gcf,[name '.fig']);

fig = figure;
set(fig,'Color','White');
plot(height,max(int)/max(max(int)), 'LineWidth',4);
    grid on
    title('Elliptic nose height scan')
    xlabel('Height, m')
    ylabel('Maximal achievable sample flux, a.u.')
set(gca, 'FontSize',16);
print(gcf,[name '_max'],'-dpng','-r300')
saveas(gcf,[name '_max' '.fig']);

fig = figure;
set(fig,'Color','White');
h = histogram(left_foc);
    title('Left focus distribution')
    xlabel('Left focus position, m')
    ylabel('Number')
set(gca, 'FontSize',16);

fig = figure;
set(fig,'Color','White');
t = histogram(right_foc);
    title('Right focus distribution')
    xlabel('Right focus position, m')
    ylabel('Number')
set(gca, 'FontSize',16);


left_foc_max = max(max(left_foc));
right_foc_max = max(max(right_foc));
left_foc_min = min(min(left_foc));
right_foc_min = min(min(right_foc));

save(name);