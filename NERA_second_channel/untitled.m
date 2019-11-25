fig = figure;
set(fig,'Color','White');
surf(height,length,left_foc);
    title('Right focus position')
    xlabel('Guide height, m')
    ylabel('Nose length, m')
    colorbar
set(gca, 'FontSize',16);

% fig = figure;
% set(fig,'Color','White');
% h = histogram(left_foc_mod);
%     title('Cleaned left focus distribution')
%     xlabel('Left focus position, m')
%     ylabel('Numberof configurations')
% set(gca, 'FontSize',16);