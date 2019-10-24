tell application "Microsoft Excel"
	set my_data to {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}, {10, 11, 12}}
	set my_range to range "A1:C4" of worksheet 1 of active workbook
	set value of my_range to my_data
	set sum_range to range "a5:c5"
	set formula of sum_range to {{"=sum(a1:a4)"}, {"=sum(b1:b4)"}, {"=sum(c1:c4)"}}
	set bold of font object of sum_range to true
	set italic of font object of sum_range to true
	set new_range to union range1 my_range range2 sum_range
	set number format of new_range to "_-£* #,##0.00_-;-£* #,##0.00_-;_-£* \"-\"??_-;_-@_-"
end tell


