set pie_count to 3
set pie_radius to 14 -- Pie radius in cm

set pie_circumference to pie_radius * pi
set ribbon_length to pie_circumference * pie_count
set ribbon_length to ribbon_length * 1.1 -- Add 10% to allow for bow-tie at end
round ribbon_length rounding up -- Round to a whole number of cm


