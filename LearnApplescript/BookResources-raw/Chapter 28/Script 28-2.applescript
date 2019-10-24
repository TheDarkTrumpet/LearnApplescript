-- Create data
set n to 1000
set x to createarray n
set y to runningsum (randomarray n range {-1, 1})
set y to multlist y with sqrt (3)

-- Display data as a curve
set c to QuickCurve(x, y, 0)
set v to c's container -- The curve belongs to a plot ...
set w to v's container -- ... which belongs to a window

-- Display equations as curves
set c1 to QuickCurve(x, "sqrt(x)", v)
set c2 to QuickCurve(x, "-sqrt(x)", v)

-- Customize appearance
set name of v to "A random walk of " & n & " steps"
set legend kind of v to 3
set legend abscissa of v to n / 2
set legend text size of v to 14
set legend fill color of v to {1, 1, 1, 1}
set label text size of v to 14
set xlabel of v to "n"
set name of c to "\\Sigma_{i=1.." & n & "}\\ Rnd_i"
set name of c1 to "n^{1/2}"
set name of c2 to "-n^{1/2}"
draw w


