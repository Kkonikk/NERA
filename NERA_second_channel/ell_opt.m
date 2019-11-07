model = mccode('NERA_guide.instr','mpi=4');
fix(model, 'all');

model.sample_size=0.03;
model.source_lambda_min=0.5;
model.source_lambda_max=5;

model.loutw = 'free'; model.loutw = [0 0.38 5];
model.linw = 'free'; model.linw = [0 12.3 20];
model.linh = 'free'; model.linh = [0 12.3 20];
model.louth = 'free'; model.louth = [0 12.3 20];
model.guide_width = 'free'; model.guide_width = [0.03 0.06 0.3];
model.guide_height = 'free'; model.guide_height = [0.03 0.15 0.3];

[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=150', nan);

a = {a {model.Parameters'; parameters}};