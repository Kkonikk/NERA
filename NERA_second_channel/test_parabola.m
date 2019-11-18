clear all
model = mccode('NERA_guide_ell_st_3part_parabol.instr','mpi=4');
fix(model, 'all');
i=1;
for length = 20:2.5:20
    j=1;
    for height = 0.2:0.04:0.2
        model.sample_size=0.03;
        model.source_lambda_min=0.5;
        model.source_lambda_max=1;

        model.ell_length = length;
        %model.loutw = 'free'; model.loutw = [0 0.38 5];
        %model.linw = 'free'; model.linw = [0 12.3 20];
        model.louth = 'free'; model.louth = [0 0.35 6];
        model.loutw = 'free'; model.louth = [0 0.35 6];

        model.guide_height = height;
        model.guide_width = 0.16;
        %model.guide_width = 'free'; model.guide_width = [0.03 0.06 0.3];
        %model.guide_height = 'free'; model.guide_height = [0.03 0.15 0.3];

        [parameters, fval, status, output]=fmax(model,[], ...
        'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;ncount=1e5;MaxFunEvals=200', nan);

        bb = model(parameters,nan);
        int(i,j) = sum(bb,'all');
        j=j+1;
    end
    i= i+1;
end
j=1;