model = mccode('NERA_ell_guide.instr');
fix(model, 'all');

model.monitor = 'monitor_nd_lambda*';
model.sample_dist = 0.35;
model.sample_size = 0.03;

model.guide_length = 107;
model.guide_height=0.14;
model.source_optics_dist = 5.61;
source_pulse_number=2;

model.source_lambda_min = 1.0;
model.source_lambda_max = 5.0;

model.nose_length = 'free'; model.nose_length = [0.5 4.8 20];
model.loutw = 'free'; model.loutw = [0 0.38 5];
model.linw = 'free'; model.linw = [0 12.3 20];
model.guide_width = 'free'; model.guide_width = [0.01 0.1 0.2];
model.linh = 0;
model.louth = 0;

[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

a = model(parameters,nan);
a1 = iData(a);
a2 = sum(a1,0);