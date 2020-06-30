clear all
name_w = '26_11_parab_w';
name_h = '26_11_parab_h';
name_lam = '26_11_parab_lambda';
%parabola

%vertical plane
%PV14,l=15,h=0.14,louth=0.99
%PV19,l=20,h=0.19,louth=0.85

%horizontal plane
%PH11,l=11,w=0.11,loutw=1.21
%PH14,l=14,w=0.14,loutw=0.92

%elliptic

%vertical plane
%EV14,l=14,h=0.14,linh=64.00,louth=0.72
%EV19,l=20,h=0.19,linh=138.36,louth=0.63

%horizontal plane
%EH11,l=12,w=0.11,linw=45.62,loutw=0.96
%EH15,l=15,w=0.15,linw=122.86,loutw=0.69


figure;
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4');
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.ell_length = 20;
parameters.guide_height = 0.19;
parameters.guide_width = 0.15;
parameters.louth = 0.85;

results = iData(model, parameters);
Signal_I = results.UserData.monitors(1).Data.data;
Signal_x = results.UserData.monitors(1).Data.x;


plot(Signal_x,Signal_I,'LineWidth',2)
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend('Profile, parabolic guide')
legend('Location','south')
set(gca, 'FontSize',16);


figure;
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4');
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.ell_length = 20;
parameters.guide_height = 0.19;
parameters.guide_width = 0.15;
parameters.louth = 0.85;

results = iData(model, parameters);
Signal_I = results.UserData.monitors(1).Data.data;
Signal_x = results.UserData.monitors(1).Data.x;


plot(Signal_x,Signal_I,'LineWidth',2)
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend('Profile, parabolic guide')
legend('Location','south')
set(gca, 'FontSize',16);


figure;
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4');
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.ell_length = 20;
parameters.guide_height = 0.19;
parameters.guide_width = 0.15;
parameters.louth = 0.85;

results = iData(model, parameters);
Signal_I = results.UserData.monitors(1).Data.data;
Signal_x = results.UserData.monitors(1).Data.x;


plot(Signal_x,Signal_I,'LineWidth',2)
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend('Profile, parabolic guide')
legend('Location','south')
set(gca, 'FontSize',16);


figure;
model = mccode('NERA_guide_parabol_profiles.instr','mpi=4');
parameters.sample_size=0.03;
parameters.source_lambda_min=0.5;
parameters.source_lambda_max=1;

parameters.ell_length = 20;
parameters.guide_height = 0.19;
parameters.guide_width = 0.15;
parameters.louth = 0.85;

results = iData(model, parameters);
Signal_I = results.UserData.monitors(1).Data.data;
Signal_x = results.UserData.monitors(1).Data.x;


plot(Signal_x,Signal_I,'LineWidth',2)
hold on
grid on
xlabel('width, m')
ylabel('I, arb.u.')
legend('Profile, parabolic guide')
legend('Location','south')
set(gca, 'FontSize',16);
















%print(gcf,name,'-dpng','-r300')
%saveas(gcf,[name '.fig']);


