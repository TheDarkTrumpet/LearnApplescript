set file_id to open for access file "Macintosh HD:Users:hanaan:work.txt" with write permission
set eof file_id to 0
write "This is the beginning..."to file_id
close access file_id
