model = mccode('NERA_ell_guide.instr');

i=1;
for w = 0.01:0.04:0.25
    fix(model, 'all');

	model.sample_size = 0.03;


	model.source_optics_dist = 5.61;
	source_pulse_number=2;

	model.source_lambda_min = 1.0;
	model.source_lambda_max = 5.0;

	model.guide_width=w;
	model.loutw = 'free'; model.loutw = [0 0.38 5];
	model.linw = 'free'; model.linw = [0 5 10];
	model.guide_height = 0.1;
	model.linh = 0;
	model.louth = 0;

	[parameters, fval, status, output]=fmax(model,[], ...
	'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=100', nan);

	B(i) = output.parsBest;
	a = model(parameters,nan);
	a1 = iData(a);
	a2 = sum(a1,0);

    A(i) = model(parameters, nan);
    I(i) = a2;
    i = i+1;
end