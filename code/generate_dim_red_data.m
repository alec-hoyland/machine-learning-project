function [D, times] = generate_dim_red_data(expID, verbose)

  if nargin < 2
    verbose = true;
  end

  % load the data, which should be a crabsort object, expects it to be named 'c'
  load(['crabsort-' expID '.mat'])
  corelib.verb(verbose, 'INFO', 'data loaded')

  % create the output container
  D = zeros(size(c.data_to_reduce, 2), 2, 4);
  times = zeros(4, 1);

  %% PCA
  corelib.verb(verbose, 'INFO', 'performing PCA')

  tic;
  c.PCA;
  times(1) = toc;
  % keyboard
  D(:, :, 1) = transpose(c.R{c.channel_to_work_with});

  %% t-SNE
  corelib.verb(verbose, 'INFO', 'performing t-SNE')

  tic;
  c.tSNE;
  times(2) = toc;
  D(:, :, 2) = transpose(c.R{c.channel_to_work_with});

  %% FIt-SNE
  corelib.verb(verbose, 'INFO', 'performing FIt-SNE')

  tic;
  c.FItSNE;
  times(3) = toc;
  D(:, :, 3) = transpose(c.R{c.channel_to_work_with});

  %% UMAP
  corelib.verb(verbose, 'INFO', 'performing UMAP')

  try
    tic;
    c.UMAP;
    times(4) = toc;
    D(:, :, 4) = transpose(c.R{c.channel_to_work_with});
  catch
    corelib.verb(verbose, 'ERROR', 'Failed to perform UMAP')
    D(:, :, 4) = NaN;
  end
