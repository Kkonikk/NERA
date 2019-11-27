clear variables;

%CHECK EVERYTHING BELOW BEFORE START

date = datestr(today('datetime'));
type = "elliptical"; %only elliptical or parabolical
dimension_plane = "horizontal"; %only vertical or horizontal
name = date + "_" + type + "_" + dimension_plane + "_scan";

model = mccode('NERA_guide_3x3_sample.instr','mpi=6;ncount=1e7');
fix(model, 'all');

model.sample_size=0.03;
model.source_lambda_min=0.5;
model.source_lambda_max=1;

left_focus_min = 5;
left_focus_max = 200;
left_focus_guess = 110;
right_focus_min = 0.3;
right_focus_max = 0.8;
right_focus_guess = 0.5;

dimension_min = 0.1; dimension_step = 0.15; dimension_max = 0.25;
nose_length_min = 5; nose_length_step = 20; nose_length_max = 25;

%CHECK EVERYTHING ABOVE BEFORE START

dimension = dimension_min:dimension_step:dimension_max;
D = length(dimension);
nose_length = nose_length_min:nose_length_step:nose_length_max;
L = length(nose_length);

if dimension_plane == "vertical"
    
    width_array(1:D) = 0.03;
    height_array = dimension;

    if  type == "elliptical"
        model.guide_shape = 1;
        model.louth = 'free'; model.louth = [right_focus_min right_focus_guess right_focus_max];
        model.linh = 'free'; model.linh = [left_focus_min left_focus_guess left_focus_max];
        model.loutw = 0;
        model.linw = 0;
    else %parabolic shape
        model.guide_shape = 0;
        model.louth = 'free'; model.louth = [right_focus_min right_focus_guess right_focus_max];
        model.linh = 0;
        model.loutw = 0;
        model.linw = 0;
    end
    
else %horizontal plane
    
    width_array = dimension;
    height_array(1:D) = 0.03;
    
    if  type == "elliptical"
        model.guide_shape = 1;
        model.louth = 0;
        model.linh = 0; 
        model.loutw = 'free'; model.loutw = [right_focus_min right_focus_guess right_focus_max];
        model.linw = 'free'; model.linw = [left_focus_min left_focus_guess left_focus_max];
    else %parabolic shape
        model.guide_shape = 0;
        model.louth = 0;
        model.linh = 0;
        model.loutw = 'free'; model.loutw = [right_focus_min right_focus_guess right_focus_max];
        model.linw = 0;
    end

end

flux = zeros(L,D);
left_foc_vertical = zeros(L,D);
right_foc_vertical = zeros(L,D);
left_foc_horizontal = zeros(L,D);
right_foc_horizontal = zeros(L,D);

for i = 1:L
    model.focusing_length = nose_length(i);
    
    for j = 1:D
        model.guide_width = width_array(j);
        model.guide_height = height_array(j);
        
        [parameters, fval, status, output]=fmax(model,[], ...
        'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;MaxFunEvals=2', nan);

        best = model(parameters,nan);
        flux(i,j) = sum(sum(best,'double'));
        left_foc_vertical(i,j)=parameters(7);
        right_foc_vertical(i,j)=parameters(8);
        left_foc_horizontal(i,j)=parameters(9);
        right_foc_horizontal(i,j)=parameters(10);
    
    end
    
end
%%
fig = figure;
set(fig,'Color','White');
for i=1:D
    plot(nose_length,flux(:,i),'LineWidth',2,'DisplayName',['d = ' num2str(dimension(i))]);
    hold on;
end  
title(type + "_" + dimension_plane + "_scan",'Interpreter','none');
grid on;
xlabel('Length of focusing nose, m');
ylabel('Sample flux, arb.u.');
legend('Location','southeastoutside');
set(gca, 'FontSize',16);
print(gcf,name,'-dpng','-r300')
saveas(gcf,name + ".fig");
%%

fig = figure;
set(fig,'Color','White');
plot(dimension,max(flux)/max(max(flux)), 'LineWidth',4);
    grid on
    title(type + "_" + dimension_plane + "_scan",'Interpreter','none')
    xlabel('Dimension, m')
    ylabel('Maximal achievable sample flux, a.u.')
set(gca, 'FontSize',16);
print(gcf,name + "_max",'-dpng','-r300')
saveas(gcf,name + "_max.fig");

%%

fig = figure;
set(fig,'Color','White');
h = histogram(left_foc_vertical);
    title('Left vertical focus distribution')
    xlabel('Left focus position, m')
    ylabel('Number')
set(gca, 'FontSize',16);

fig = figure;
set(fig,'Color','White');
t = histogram(right_foc_vertical);
    title('Right vertical focus distribution')
    xlabel('Right focus position, m')
    ylabel('Number')
set(gca, 'FontSize',16);

fig = figure;
set(fig,'Color','White');
h = histogram(left_foc_horizontal);
    title('Left horizontal focus distribution')
    xlabel('Left focus position, m')
    ylabel('Number')
set(gca, 'FontSize',16);

fig = figure;
set(fig,'Color','White');
t = histogram(right_foc_horizontal);
    title('Right horizontal focus distribution')
    xlabel('Right focus position, m')
    ylabel('Number')
set(gca, 'FontSize',16);

%%

save(name);