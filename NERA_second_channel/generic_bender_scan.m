function generic_bender_scan(L,N,width)
Lb_min = 1; Lb_step = 5; Lb_max = 66;
n_chan_min = 1; n_chan_step = 1; n_chan_max = N;
model = mccode('./NERA_guide_3x3_sample_curved.instr','ncount=1e6;mpi=6');

name = 'Curved guide transmission';
parameters.sample_width=width;
parameters.sample_height=0.2;
parameters.guide_start_width=width;
parameters.guide_start_height=0.2;
parameters.source_lambda_min=2.5;
parameters.source_lambda_max=2.6;
parameters.cold_regime=0;
parameters.m_out=6;
parameters.m_in=6;
parameters.m_str_side=6;
parameters.m_top=6;

model_str = mccode('./NERA_guide_3x3_sample_straight.instr','ncount=1e6;mpi=6');
parameters_str.guide_length = L;
parameters_str.m_str_side=6;
parameters_str.m_top=6;
parameters_str.sample_width=width;
parameters_str.sample_height=0.2;
parameters_str.guide_start_width=width;
parameters_str.guide_start_height=0.2;
parameters_str.source_lambda_min=2.5;
parameters_str.source_lambda_max=2.6;
parameters_str.cold_regime=0;
results_str = iData(model_str,parameters_str);
%sum_L_str = sum(results_str, 0);
sum_L_str = results_str.UserData.monitors.Data.values(1);

figure
for n_chan = n_chan_min:n_chan_step:n_chan_max
    i=1;
    for Lb=Lb_min:Lb_step:Lb_max
        Ls = L - Lb;
        R = Lb*Lb/8/width;
        parameters.n_chan=n_chan;
        parameters.l_bender = Lb;
        parameters.l_straight = Ls;
        parameters.R_curv = R;
        results = iData(model,parameters);
        sum_Lb(i) = results.UserData.monitors.Data.values(1);
        i = i+1;
    end
    sum_Lb=sum_Lb/sum_L_str;
    plot(Lb_min:Lb_step:Lb_max,sum_Lb,'LineWidth',2,'DisplayName',['n chan =' num2str(n_chan)]);
    hold on
end

title(name)
grid on
xlabel('Lb, m')
ylabel('transmission')
legend
legend('Location','south')
print(gcf,[name 'bend_scan'],'-dpng','-r300')
%matlab2tikz([name 'm_scan.tex'], 'width', '0.85\textwidth');
saveas(gcf,[name 'bend_scan.fig']);