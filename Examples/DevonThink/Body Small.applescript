-- Script Format > Body Small
-- Created by Christian Grunenberg on Sat May 15 2004.
-- Copyright (c) 2004-2014. All rights reserved.

tell application id "DNtp"
	try
		tell selected text of think window 1
			set properties to {alignment:justified, font:"Times", size:10, color:{0, 0, 0}, background:{55000, 55000, 55000}}
		end tell
	end try
end tell