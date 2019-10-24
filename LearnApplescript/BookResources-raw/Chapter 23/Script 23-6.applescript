 tell application id "com.adobe.illustrator"
	 set selected of every page item of document 1 to true
	 activate
	 copy
	 make new document with properties {color space:CMYK}
	 paste
 end tell


