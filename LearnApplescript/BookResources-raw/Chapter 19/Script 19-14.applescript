on make_file_log(file_path)
	script FileLog
		property class : "file log"
		property parent : make_log_base()

		on _write(the_text) -- Writes log messages to a UTF8-encoded text file
			set f to open for access file_path with write permission
			try
				write (the_text & my _linefeed) to f starting at eof as «class utf8»
			on error error_message number error_number
				close access f
				error error_message number error_number
			end try
			close access f
		end _write
	end script
end make_file_log


