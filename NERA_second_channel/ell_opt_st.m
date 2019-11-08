model = mccode('NERA_guide_ell_st_3part.instr','mpi=4');
fix(model, 'all');
j=1;
for length = 1:10:101
    i=1;
    for height = 0.01:0.02:0.2
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        %model.loutw = 'free'; model.loutw = [0 0.38 5];
        %model.linw = 'free'; model.linw = [0 12.3 20];
        model.loutw = 0;
        model.linw = 0;
        model.linh = 'free'; model.linh = [0 12.3 20];
        model.louth = 'free'; model.louth = [0 0.35 5];

        model.guide_height = height;
        model.guide_width = 0.15;
        %model.guide_width = 'free'; model.guide_width = [0.03 0.06 0.3];
        %model.guide_height = 'free'; model.guide_height = [0.03 0.15 0.3];

        [parameters, fval, status, output]=fmax(model,[], ...
        'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=50', nan);

        bb = model(parameters,nan);
        int(i,j) = sum(bb,'all');
    end
    j= j+1;
end
j=1;
