% generate the dimensionally-reduced data, and time it
[D, times] = generate_dim_red_data('901_046_0000');

% plot the dimensionally reduced data
fig1 = figure('OuterPosition',[0 0 1600 1600],'PaperUnits','points','PaperSize',[1600 1600]);
figure_dim_red_comparison(fig1, D);
