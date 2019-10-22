-- Open in two windows.
-- Created by Jim Neumann on Aug 23 2017.
-- Modified to support Retina displays - Apr 14 2019
-- Copyright (c) 2017-2019 BLUEFROG/Jim Neumann/DEVONtechnologies, LLC. All rights reserved.

global x, y, x2, y2, xWidth

set pAnnotationNotFound to localized string "This document appears to have an Annotation but the document cannot be located."
set pSelectOneOrTwoRecord to localized string "Please select either one or two documents in DEVONthink."

--tell application "Finder" to set {w, h} to {item 3, item 4} of (bounds of window of desktop as list)
-- This is MUCH faster than the shell approach below BUT deprecated because people use PathFinder

set divisor to 2
set displayRes to (do shell script "system_profiler SPDisplaysDataType | grep Resolution | sed -E 's_.* ([0-9]*) x ([0-9]*)_ÄÄ1  ÄÄ2'_")
set {w, h} to {word 1, word 2} of displayRes
if displayRes contains "Retina" then set divisor to 4

tell application id "DNtp"
	-- set up window calcs
	set {y, x2, y2} to items 2 thru 4 of ((bounds of viewer window 1) as list) -- should be main window
	set xWidth to (w / divisor) as integer
	set x to ((w - (xWidth * divisor)) / divisor) as integer
	
	if (count selection) = 1 then
		set curRec to (item 1 of (selection as list))
		if (comment of curRec) begins with "Original URL:" then -- This would be the case with a DEVONthink created Annotation
			set annotationDoc to (get record with uuid (do shell script "echo " & (URL of curRec) & " | sed -E 's_.*/(.*$)_ÄÄ1_'")) -- The URL of the original should link to the Annotation now
			if annotationDoc ÅÇ missing value then -- If there's a hit, open the original and Annotation, side by side
				my twoDoc({curRec, item 1 of annotationDoc})
			else -- The Annotation doc can't be located
				display alert (pAnnotationNotFound)
				my oneDoc(curRec)
			end if
		else
			my oneDoc(curRec)
		end if
	else if (count selection) = 2 then
		my twoDoc(selection as list)
	else
		display alert pSelectOneOrTwoRecord as warning
	end if
end tell

on oneDoc(sel)
	tell application id "DNtp"
		repeat 2 times
			open tab for record sel
			set bounds of window 1 to {x, y + 60, x + xWidth, y2} -- bounds is a property of a window, NOT a think / viewer / document window
			set x to (x + xWidth)
		end repeat
	end tell
end oneDoc

on twoDoc(sel)
	tell application id "DNtp"
		repeat with curRec in sel
			open tab for record curRec
			set bounds of window 1 to {x, y + 60, x + xWidth, y2}
			set x to (x + xWidth)
		end repeat
	end tell
end twoDoc