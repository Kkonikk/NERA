1.1253e+13/1.1815e+13 - m = 6
1.1220e+13/1.0469e+13 - m = 3

%parabola focus and everything
l0 = output_par_hor_ideal.parsBest_struct.focusing_length + ...
    output_par_hor_ideal.parsBest_struct.linw;
w0 = output_par_hor_ideal.parsBest_struct.guide_width;
length_cut = l0/20:l0/20:l0*19/20;
p = 1/2*(-l0 + sqrt(l0^2 + w0^2/2));
w_n = sqrt(8*p*(l0+p/2-length_cut));

% y^2 = 2*p*x;
% (w_n/2)^2 = 2*p*(l0+f-n);