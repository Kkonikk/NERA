figure;
plot(dat1(:,1),dat1(:,2),'LineWidth',2)
hold on
plot(dat2(:,1),dat2(:,2),'LineWidth',2)
grid on
xlabel('y, m')
ylabel('I, arb.u.')
legend('small nose','fully optimized nose')
legend('Location','south')
set(gca, 'FontSize',16);

set(gcf,'Position',[100 100 1200 800])

print(gcf,'diff_nose_sm_f','-dpng','-r300')
saveas(gcf,'diff_nose_sm_f');
