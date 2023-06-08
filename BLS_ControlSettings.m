% BLS_CONTROLSETTINGS  Set parameters to control the BLS algorithm
%
% CONTROLS = BLS_CONTROLSETTINGS
%
% OUTPUT ARGUMENTS:
% 
%	CONTROLS	A structure whose fields control various aspects of the
%				running of the BLS algorithm.
% 
%	.ZeroFactor			Small number equivalent to zero for Q^2-S
%	.MinDeltaLogAlpha	Termination criterion for changes in log-alpha
%	.MinDeltaLogBeta	Termination criterion for changes in log-beta
% 
%	.PriorityAddition	Prefer "addition" operations
%	.PriorityDeletion	Prefer "deletion" operations
% 
%	.BetaUpdateStart	How many "fast start" beta updates
%	.BetaUpdateFrequency	
%						How regularly to update beta after the above
%	.BetaMaxFactor		Minimum value control for noise estimate
% 
%	.PosteriorModeFrequency	
%						How regularly to re-find the posterior mode
% 
%	.BasisAlignmentTest	Test for redundant basis vectors?
%	.AlignmentMax		Basis redundancy criterion
% 


% Copyright 2023, Ingvild Helgøy
% Copyright 2009, Vector Anomaly Ltd
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
function CONTROLS = BLS_ControlSettings

%% Define parameters which influence the underlying operation of the 
%% BLS inference algorithm

% TOLERANCES
% 
% Any Q^2-S "relevance factor" less than this is considered to be zero
% 
CONTROLS.ZeroFactor			= 1e-12;
%
% If the change in log-alpha for the best re-estimation is less than this,
% we consider termination
% 
CONTROLS.MinDeltaLogAlpha	= 1e-3;
%
% In the Gaussian case, we also require a beta update to change the value
% of log-beta (inverse noise variance) less than this to terminate
% 
CONTROLS.MinDeltaLogBeta	= 1e-6;

% ADD/DELETE
% 
% - preferring addition where possible will probably make the algorithm a
% little slower and perhaps less "greedy"
% 
% - preferring deletion may make the model a little more sparse and the
% algorithm may run slightly quicker
% 
% Note: both these can be set to 'true' at the same time, in which case
% both take equal priority over re-estimation.
% 
CONTROLS.PriorityAddition	= false;
CONTROLS.PriorityDeletion	= true;

% (GAUSSIAN) NOISE
%
% When to update the noise estimate
%
% The number of iterations from the start for which we update it every
% iteration (to get in the right ball-park to begin with)
% 
CONTROLS.BetaUpdateStart		= 10;
%
% After the above, we only regularly update it after 
% a given number of iterations
% 
CONTROLS.BetaUpdateFrequency	= 5;
%
% Prevent zero-noise estimate (perfect fit) problem
% -	effectively says the noise variance estimate is clamped to be no
%	lower than variance-of-targets / BetaMaxFactor.
% 
CONTROLS.BetaMaxFactor			= 1e6;




% REDUNDANT BASIS
%
% Check for basis vector alignment/correlation redundancy
% 
CONTROLS.BasisAlignmentTest		= true;
%
ALIGNMENT_ZERO					= 1e-3;
%
% If BasisAlignmentTest is true, any basis vector with inner product more
% than MAX_ALIGNMENT with any existing model vector will not be added
% 
CONTROLS.AlignmentMax			= 1 - ALIGNMENT_ZERO;

