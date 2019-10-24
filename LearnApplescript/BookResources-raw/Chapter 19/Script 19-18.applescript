on make_error_filter(log_object)
	script ErrorFilter
		property parent : log_object

		on log_important(the_text)
		end log_important

		on log_message(the_text)
		end log_message
	end script
end make_error_filter

on make_timestamp_adder(log_object)
	script TimestampAdder
		property parent : log_object

		on _write(the_text)
			tell (current date)
				set time_stamp to its short date string & space & its time string
			end tell
			continue _write(time_stamp & tab & the_text)
		end _write
	end script
end make_timestamp_adder


