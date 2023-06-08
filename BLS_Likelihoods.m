% BLS_LIKELIHOODS  Convenience function to encapsulate likelihood types
% 
% LIKELIHOOD = BLS_LIKELIHOODS(TYPE)
% 
% OUTPUT ARGUMENTS:
% 
%	LIKELIHOOD	A structure containing an enumeration of possible
%				likelihood types, and specification of the type in use.
% 
% INPUT ARGUMENTS:
% 
%	TYPE		A string. One of:
%					'Gaussian'
%					'Bernoulli'
%					'Poisson'
% 
% EXAMPLE:
%
%	LIKELIHOOD	= BLS_Likelihoods('Gaussian');
%


% Copyright 2023, Ingvild Helgøy
% Copyright 2009, Vector Anomaly Ltd
% 
% This file is part of the BLS toolbox.
%
% BLS is free software; you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by the Free
% Software Foundation; either version 2 of the License, or (at your option)
% any later version.
%
% BLS is distributed in the hope that it will be useful, but WITHOUT
% ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
% FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
% more details.
%
% You should have received a copy of the GNU General Public License along
% with BLS in the accompanying file "licence.txt"; if not, write to
% the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
% MA 02110-1301 USA
%
function LIKELIHOOD = BLS_Likelihoods(likelihood_)

% For convenience in code, and later expandability,
% we "enum" the available likelihood models
%
% Continuous
LIKELIHOOD.Gaussian		= 1;
% Discrete
LIKELIHOOD.Bernoulli	= 2;
LIKELIHOOD.Poisson		= 3;

% Feel free to add your own ... and work out the maths :-)

% Determine the likelihood to be used
% 
LIKELIHOOD.InUse		= 0;
%
switch upper(likelihood_(1:5))
 case 'GAUSS',
  LIKELIHOOD.InUse	= LIKELIHOOD.Gaussian;
  %
 case 'BERNO',
  LIKELIHOOD.InUse	= LIKELIHOOD.Bernoulli;
  %
 case 'POISS',
  LIKELIHOOD.InUse	= LIKELIHOOD.Poisson;
  %
 otherwise
  error('Unknown likelihood ''%s'' specified\n', likelihood_)
end

