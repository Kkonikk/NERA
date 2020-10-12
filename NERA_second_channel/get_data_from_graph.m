D=get(gca,'Children'); %get the handle of the line object
XData=get(D,'XData'); %get the x data
YData=get(D,'YData'); %get the y data

for i = 1:6
YData2{i,1} = YData{i,1}/1.2e13;
end

figure;
for i = 1:6
    plot(XData{i,1},YData2{i,1},'LineWidth',2)
    hold on
end
grid on
xlabel('m')
ylabel('I, arb.u.')
legend
legend('Location','south')
set(gca, 'FontSize',16);
set(gcf,'Position',[100 100 1200 800])

print(gcf,'width_m_scan_norm','-dpng','-r300')
saveas(gcf,'width_m_scan_norm');
