model = mccode('NERA_ell_guide.instr');

i=1;
for h = 0.01:0.04:0.31
    fix(model, 'all');

	model.sample_size = 0.03;

	model.guide_width=0.1;
	model.source_optics_dist = 5.61;
	source_pulse_number=2;

	model.source_lambda_min = 1.0;
	model.source_lambda_max = 5.0;

	%model.loutw = 'free'; model.loutw = [0 0.38 5];
	%model.linw = 'free'; model.linw = [0 5 10];
	model.loutw=0;
	model.linw=0;
	model.guide_height = h;
	%model.guide_height = 'free'; model.guide_height = [0.01 0.2 0.3];
	model.linh = 'free'; model.linh = [0 10 20];
	model.louth = 'free'; model.louth = [0 0.35 5];

	[parameters, fval, status, output]=fmax(model,[], ...
	'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=50', nan);

	B(i) = {output.parsBest};
	a = model(parameters,nan);
	a1 = iData(a);
	a2 = sum(a1,0);

    I(i) = a2;
    i = i+1;
end