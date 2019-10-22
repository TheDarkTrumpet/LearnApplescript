-- Script Format > Reset Spacing
-- Created by Christian Grunenberg on Mon Aug 01 2005.
-- Copyright (c) 2005-2014. All rights reserved.

tell application id "DNtp"
	try
		tell selected text of think window 1
			set {line spacing, paragraph spacing, minimum line height, maximum line height} to {0.0, 0.0, 0.0, 0.0}
		end tell
	end try
end tell