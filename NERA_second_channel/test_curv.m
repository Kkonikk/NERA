L_los=77;
width=0.05;
for j=1:25
    Ls(j)=76-j*3;
    R(j) = L_los^2/4/width*(L_los^2-4*Ls(j).^2+4*L_los*Ls(j))/(L_los+2*Ls(j)).^2;
    Lb(j)=76-Ls(j);
end

plot(Lb, R)

