set c to {250, 250}
set r to 100
set i to first character of (system attribute "USER")
BeginFigure(0)
SetPenColor({1 / 8, 1 / 4, 1 / 2})
SetFillColor({1 / 4, 1 / 2, 1, 1 / 2})
CirclePath(c, r)
DrawPath("fill-stroke") -- or: 3
TextMoveTo(c)
SetTextSize(1.5 * r)
SetTextFont("Courier")
SetFillGray(1)
DrawString("[h]" & i)
DrawPath("fill") -- or: 0
EndFigure()


