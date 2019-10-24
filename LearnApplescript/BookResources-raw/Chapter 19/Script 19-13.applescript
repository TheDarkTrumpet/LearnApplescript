on make_log_base()
	script LogBase
		property _linefeed : character id 10

		on _write(the_text)
			-- Sub-classes should override this method to write all text
			-- to their preferred output device
			error "Not implemented." number -1708
		end _write

		on log_important(the_text)
			_write("****** " & the_text & " ******")
		end log_important

		on log_message(the_text)
			_write(the_text)
		end log_message

		on log_error(the_text)
			_write("ERROR: " & the_text)
		end log_error
	end script
end make_log_base


