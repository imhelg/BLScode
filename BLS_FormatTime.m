% BLS_FORMATTIME  Pretty output of diagnostic SPARSEBAYES time information
%
% STRING = BLS_FORMATTIME(ELAPSEDTIMEINSECONDS)
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
function timeString_ = BLS_FormatTime(elapsedTime)

if elapsedTime>=3600
  % More than an hour...
  % 
  h		= floor(elapsedTime/3600);
  m		= floor(rem(elapsedTime,3600)/60);
  s		= floor(rem(elapsedTime,60));
  %
  timeString_	= sprintf('%dh %dm %ds', h,m,s);
elseif elapsedTime>=60
  % More than one minute (but less than an hour)
  m		= floor(elapsedTime/60);
  s		= floor(rem(elapsedTime,60));
  %
  timeString_	= sprintf('%dm %ds', m,s);
else
  % Under a minute
  s		= elapsedTime;
  %
  timeString_	= sprintf('%2.2f secs', s);
end