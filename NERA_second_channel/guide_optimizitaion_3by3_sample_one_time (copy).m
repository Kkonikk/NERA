date = datestr(today('datetime'));
type = "elliptical"; %only elliptical or parabolical
dimension_plane = "vertical"; %only vertical or horizontal
name = date + "_" + type + "_" + dimension_plane + "_scan";


model = mccode('NERA_guide_3x3_sample.instr','mpi=8;ncount=5e6');
fix(model, 'all');


model.sample_size=0.03;
model.source_lambda_min=0.5;
model.source_lambda_max=1;

model.guide_width = 0.4;
model.guide_height = 'free'; model.guide_height = [0.1 0.2 0.23];
model.focusing_length = 'free'; model.focusing_length = [10 20 30];

left_focus_min = 0.1;
left_focus_max = 600;
left_focus_guess = 100;
right_focus_min = 0.1;
right_focus_max = 2;
right_focus_guess = 0.5;

if dimension_plane == "vertical"

if  type == "elliptical"
    model.guide_shape = 1;
    model.louth = 'free'; model.louth = [right_focus_min right_focus_guess right_focus_max];
    model.linh = 'free'; model.linh = [left_focus_min left_focus_guess left_focus_max];
    model.loutw = 0;
    model.linw = 0;
else %parabolic shape
    model.guide_shape = 0;
    model.louth = 'free'; model.louth = [right_focus_min right_focus_guess right_focus_max];
    model.linh = 0;
    model.loutw = 0;
    model.linw = 0;
end

else %horizontal plane
    
    if  type == "elliptical"
        model.guide_shape = 1;
        model.louth = 0;
        model.linh = 0; 
        model.loutw = 'free'; model.loutw = [right_focus_min right_focus_guess right_focus_max];
        model.linw = 'free'; model.linw = [left_focus_min left_focus_guess left_focus_max];
    else %parabolic shape
        model.guide_shape = 0;
        model.louth = 0;
        model.linh = 0;
        model.loutw = 'free'; model.loutw = [right_focus_min right_focus_guess right_focus_max];
        model.linw = 0;
    end

end

        
[parameters, fval, status, output]=fmax(model,[], ...
'optimizer=fminpso; OutputFcn=fminplot;TolFun =5%;TolX=5%;MaxFunEvals=500', nan);