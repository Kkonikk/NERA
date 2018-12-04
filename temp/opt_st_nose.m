model = mccode('NERA_st_nose.instr');
fix(model, 'all');

model.sample_size = 0.03;

model.source_optics_dist = 5.61;


model.source_lambda_min = 1.0;
model.source_lambda_max = 5.0;

model.guide_width = 'free';model.guide_width = [0.01 0.1 0.25];
model.guide_height = 'free'; model.guide_height = [0.01 0.2 0.3];
model.l_tap = 'free';model.l_tap = [0.1 2 50];
model.loutw = 'free'; model.loutw = [0 0.38 5];
model.linw = 'free'; model.linw = [0 5 10];
model.linh = 'free'; model.linh = [0 10 20];
model.louth = 'free'; model.louth = [0 0.35 5];

[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=200', nan);

output.parsBest
a = model(parameters,nan);
a1 = iData(a);
a2 = sum(a1,0);