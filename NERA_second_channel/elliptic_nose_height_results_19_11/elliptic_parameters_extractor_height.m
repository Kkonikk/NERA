for i=1:16
    for j=1:11
        left_foc(i,j)=ell_param{i,j}(2);
        right_foc(i,j)=ell_param{i,j}(3);
    end
end
figure;
h = histogram(left_foc);

figure;
t = histogram(right_foc);


max(max(left_foc))
max(max(right_foc))
min(min(left_foc))
min(min(right_foc))