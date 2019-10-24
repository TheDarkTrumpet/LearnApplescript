set my_data to {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {10, 11, 12}}
tell application "Microsoft Excel"
	set my_range to range "A1:C4" of worksheet 1 of active workbook
	set value of my_range to my_data
end tell


