% generate the dimensionally-reduced data, and time it
% assume there's a .mat file on your path named 'crabsort-<whatever>.mat'
% that contains a crabsort object named c
% that has the 'data_to_reduce' property filled out
% give 'generate_dim_red_data' 'whatever' as an argument
% and it will compute the points in the reduced manifold

[D, times] = generate_dim_red_data('901_046_0000');

% plot the dimensionally reduced data
fig1 = figure('OuterPosition',[0 0 1600 1600],'PaperUnits','points','PaperSize',[1600 1600]);
figure_dim_red_comparison(fig1, D);
