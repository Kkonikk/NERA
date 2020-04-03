N=3;
L=80;
k_los=1.2;
L_los=L/k_los;

n_chan_min = 1; n_chan_step = 1; n_chan_max = N;
Lb_min = 1; Lb_step = 1; Lb_max = 66;

name = 'Curved guide transmission';


for j=1:2
    width(j)=(j+20)/100;
    

model = mccode('./NERA_guide_3x3_sample_curved.instr','ncount=1e6;mpi=6');
parameters.sample_width=width(j);
parameters.sample_height=0.2;
parameters.guide_start_width=width(j);
parameters.guide_start_height=0.2;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=0.6;
parameters.m_out=6;
parameters.m_in=6;
parameters.m_str_side=6;
parameters.m_top=6;

model_str = mccode('./NERA_guide_3x3_sample_straight.instr','ncount=1e6;mpi=6');
parameters_str.guide_length = L;
parameters_str.m_str_side=6;
parameters_str.m_top=6;
parameters_str.sample_width=width(j);
parameters_str.sample_height=0.2;
parameters_str.guide_start_width=width(j);
parameters_str.guide_start_height=0.2;
parameters_str.source_lambda_min=0.5;
parameters_str.source_lambda_max=0.6;
results_str = iData(model_str,parameters_str);
sum_L_str = results_str.UserData.monitors.Data.values(1);

figure
k=0;
for n_chan = n_chan_min:n_chan_step:n_chan_max
    k=k+1;
    i=1;
    for Lb=Lb_min:Lb_step:Lb_max
        Ls = L - Lb;
        %R = Lb*Lb/8/width(j);
        R = L_los^2/4/width(j)*(L_los^2-4*Ls^2+4*L_los*Ls)/(L_los+2*Ls)^2;
        parameters.n_chan=n_chan;
        parameters.l_bender = Lb;
        parameters.l_straight = Ls;
        parameters.R_curv = R;
        results = iData(model,parameters);
        sum_Lb(k,i) = results.UserData.monitors.Data.values(1)/sum_L_str;
        i = i+1;

    end

    plot(Lb_min:Lb_step:Lb_max,sum_Lb(k,:),'LineWidth',2,'DisplayName',['n chan =' num2str(n_chan)]);
    hold on
end
trans(j) = max(max(sum_Lb));

title(name)
grid on
xlabel('Lb, m')
ylabel('transmission')
legend
legend('Location','south')
print(gcf,[name 'bend_scan'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name num2str(width(j)) 'bend_scan.fig']);

end

figure; hold on;
plot(width, trans);

