model = mccode('NERA_guide_ell_st.instr','mpi=4');
fix(model, 'all');

model.sample_size=0.03;
model.source_lambda_min=0.5;
model.source_lambda_max=1;
model.guide_length_st = 10;

model.guide_width_st = 'free'; model.guide_width_st = [0.01 0.2 0.4];
model.guide_height_st = 'free'; model.guide_height_st = [0.01 0.2 0.4];


model.ell_length = 'free'; model.ell_length = [0.5 10 60];
model.loutw = 'free'; model.loutw = [0 0.38 5];
model.linw = 'free'; model.linw = [0 12.3 20];
model.linh = 'free'; model.linh = [0 12.3 20];
model.louth = 'free'; model.louth = [0 0.35 5];

model.loutw2 = 'free'; model.loutw2 = [0 0.38 5];
model.linw2 = 'free'; model.linw2 = [0 12.3 20];
model.linh2 = 'free'; model.linh2 = [0 12.3 20];
model.louth2 = 'free'; model.louth2 = [0 0.35 5];

model.guide_width = 'free'; model.guide_width = [0.03 0.06 0.3];
model.guide_height = 'free'; model.guide_height = [0.03 0.15 0.3];

[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=300', nan);

a = {{model.Parameters'; parameters}};