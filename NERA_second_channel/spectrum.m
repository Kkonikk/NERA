sspectrum = eb.Ch*4000/35.6/10000;
fig = figure;
set(fig,'Color','White');
plot(sspectrum,eb.DBD_Is, 'LineWidth',4) 

    grid on
    title('Yumo spectrum')
    xlabel('Wavelength, AA')
    ylabel('Counts')
set(gca, 'FontSize',16);
    xlim ([0 2]);