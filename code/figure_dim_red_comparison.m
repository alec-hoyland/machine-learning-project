function figure_dim_red_comparison(fig, D)

  % Arguments:
  %   fig: a figure handle (optional)
  %   D: the data in the form of n x 2 x 4
  %     the first dimension is the number of data points
  %     the second dimension are the reduced dimensions
  %     the third dimension is for naive, t-SNE, FIt-SNE, and UMAP

  %% Plot the figure
  % 2x2 grid

  if nargin < 2
    D   = fig;
    fig = figure;
  else
    set(0, 'CurrentFigure', fig);
  end

  for ii = 4:-1:1
    ax(ii) = subplot(2, 2, ii); hold on
    scatter(ax(ii), squeeze(D(:, 1, ii)), squeeze(D(:, 2, ii)), 'k', 'MarkerEdgeAlpha', 0.5)
  end

  title(ax(1), 'PCA')
  title(ax(2), 't-SNE')
  title(ax(3), 'FIt-SNE')
  title(ax(4), 'UMAP')

  figlib.pretty()

end % function
