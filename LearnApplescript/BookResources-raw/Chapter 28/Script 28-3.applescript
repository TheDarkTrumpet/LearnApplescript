property v : 0

on prepare theDialog
		set v to 0
		repeat with i from 2 to 12 by 2
			 set contained data of dialog item i of theDialog to ""
		end repeat
end prepare

on RefreshDisplay(d)
	tell d
		set s to contained data of dialog item 2
		set text_font to contained data of dialog item 4
		set text_size to contained data of dialog item 6
		set x to contained data of dialog item 8
		set y to contained data of dialog item 10
		set w_name to contained data of dialog item 12
	end tell
	set w to graphic window w_name
	set {dx, dy, the_width, the_height} to measuretext s font {text font:text_font, text size:text_size }
	try
		set frame of v to {x, y + dy, the_width, the_height}
	on error
		set v to make new picture view at w with properties {frame:{x, y + dy, the_width, the_height}}
	end
	BeginFrontFigure(v)
	SetTextFont(text_font)
	SetTextSize(text_size)
	TextMoveTo({0, -dy})
	DrawText(s)
	DrawPath("stroke")
	EndFrontFigure()
	draw w
end RefreshDisplay

on MergeCurrent(d)
	set v to 0
	set contained data of dialog item 2 of d to ""
end MergeCurrent

on click in d item number n
	if n = 13 then
		RefreshDisplay(d)
	else if n = 14 then
		MergeCurrent(d)
	end if
end click in


