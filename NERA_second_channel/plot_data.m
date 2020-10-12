figure;
plot(mc1(:,1),mc1(:,2),'LineWidth',2)
hold on
plot(mc2(:,1),mc2(:,2),'LineWidth',2)
plot(mc3(:,1),mc3(:,2),'LineWidth',2)
plot(mc4(:,1),mc4(:,2),'LineWidth',2)
grid on
xlabel('m')
ylabel('I, arb.u.')
legend('guide: 0 - 5 m','guide: 5 - 10 m','guide: 10 - 15 m','guide: 15 - 20 m')
legend('Location','south')
set(gca, 'FontSize',16);

set(gcf,'Position',[100 100 1200 800])

print(gcf,'nose_m_optimization','-dpng','-r300')
saveas(gcf,'nose_m_optimization');
