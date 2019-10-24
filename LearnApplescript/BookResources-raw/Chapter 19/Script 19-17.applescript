on make_group_log(log_objects)
	script GroupLog
		property class : "group log"

		on log_important(the_text)
			repeat with log_ref in log_objects
				log_ref's log_important(the_text)
			end repeat
		end log_important

		on log_message(the_text)
			repeat with log_ref in log_objects
				log_ref's log_message(the_text)
			end repeat
		end log_message

		on log_error(the_text)
			repeat with log_ref in log_objects
				log_ref's log_error(the_text)
			end repeat
		end log_error
	end script
end make_group_log


