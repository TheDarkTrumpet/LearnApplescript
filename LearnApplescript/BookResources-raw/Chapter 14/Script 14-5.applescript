 set html to "<html>" & return & "<head>" & return
 set html to html & "<title>Multiplication Table</title>" & return
 set html to html & "</head>" & return & "<body>" & return
 set html to html & "<table border=1 cellpadding=2>" & return

 repeat with i from 1 to 10
	 set html to html & "<tr>" & return
	 repeat with j from 1 to 10
		 set html to html & "<td>" & (i * j) & "</td>"
	 end repeat
	 set html to html & "</tr>" & return
 end repeat
 set html to html & "</table>" & return & "</body>" & return & "</html>"


