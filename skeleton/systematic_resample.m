% function S = systematic_resample(S_bar)
% This function performs systematic re-sampling
% Inputs:
%           S_bar(t):       4XM
% Outputs:
%           S(t):           4XM
function S = systematic_resample(S_bar)
% FILL IN HERE

  % The number of particles M
  M = size(S_bar, 2);

  r_0 = rand / M;

  S = zeros(4, M);

  cdf = cumsum(S_bar(4,:));

  for m = 1:M
    i = find(cdf >= r_0 + (m-1) / M, 1, 'first');

    S(:,m) = S_bar(:,i);

    S(4,m) = 1 / M;
  end

end
