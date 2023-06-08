% BLS_DIAGNOSTIC  Helper function to output diagnostics in BLS
%
% USAGE (1):
%
% OPTIONS = BLS_DIAGNOSTIC(OPTIONS, ACTION)
%
% OUTPUT ARGUMENTS:
% 
%	OPTIONS		Returned OPTIONS settings, possibly updated
%				(e.g. with file handle after 'open' action)
% 
% INPUT ARGUMENTS:
%
%	OPTIONS		Options settings (BLS_USEROPTIONS)
%
%	ACTION		One of:
%				'OPEN' or 'START'			Begin diagnostics
%				'CLOSE', 'END' or 'FINISH'	End diagnostics
% 
% 
% USAGE (2):
%
%	BLS_DIAGNOSTIC(OPTIONS, LEVEL, MESSAGE, VARARGIN ...)
%
% OUTPUT ARGUMENTS: None
% 
% INPUT ARGUMENTS:
%
%	OPTIONS		Options settings (BLS_USEROPTIONS)
%	
%	LEVEL		Importance level of message (0 to 4)
%				NB: LOWER is MORE IMPORTANT
% 
%	MESSAGE		Message string
% 
%	VARARGIN	Optional arguments to fill in string placeholders
% 
% EXAMPLE:
%
%	OPTIONS = BLS_Diagnostic(OPTIONS, 'start');
%	BLS_Diagnostic(OPTIONS,2,'Total of %d likelihood updates\n', 25);
%	OPTIONS = BLS_Diagnostic(OPTIONS, 'end');
%
% NOTES:
% 
% This function offers a convenient way to output diagnostic information,
% either to screen or to a file.
% 
% It will "filter" the incoming messages and only display/write them if
% their LEVEL is less than or equal to the DIAGNOSTICLEVEL as set by
% BLS_USEROPTIONS.
% 
% e.g. after
% 
%	OPTIONS	= BLS_UserOptions('diagnosticLevel',2)
% 
% This message won't display: 
% 
%	BLS_Diagnostic(OPTIONS, 3, 'Pointless message')
% 
% But this will: 
% 
%	BLS_Diagnostic(OPTIONS, 1, 'Really important message')
% 
% Messages of level 0 are therefore most "important", and those of level
% 4 least important. Level-0 messages are always displayed, since the
% DIAGNOSTICLEVEL will always be at least zero.
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
function OPTIONS = BLS_Diagnostic(OPTIONS, level, message_, varargin)

%
% Check if "level" is actually a string (this is a control call)
%
if ischar(level)
  switch upper(level)
   case {'OPEN','START'},
    if OPTIONS.diagnosticFID~=1
	  %
	  % If diagnosticFID is not 1, we must have previously set a
      % diagnostics file via BLS_USEROPTIONS
	  % 
      OPTIONS.diagnosticFID	= fopen(OPTIONS.diagnosticFile_,'w');
      % Check for file open error
      if OPTIONS.diagnosticFID==-1
		error('Could not open diagnostic file ''%s''', value);
      end
    end
    %
   case {'CLOSE','END','FINISH'},
    if OPTIONS.diagnosticFID~=1
	  % diagnosticFID refers to a file opened above
      fclose(OPTIONS.diagnosticFID);
    end
  end
else
  %
  % Its a message call.
  % 
  % Only output diagnostic messages if the "diagnostic level",
  % set via BLS_USEROPTIONS, is equal to or greater than the level of 
  % the message to be displayed.
  % 
  if level<=OPTIONS.diagnosticLevel
    fprintf(OPTIONS.diagnosticFID, repmat('    ', [1 level]));
    fprintf(OPTIONS.diagnosticFID, message_, varargin{:});
  end
end

