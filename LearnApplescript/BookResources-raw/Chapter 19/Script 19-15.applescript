on make_textedit_log(log_name)
	script TextEditLog
		property class : "textedit log"
		property parent : make_log_base()

		on _write(the_text)
			tell application "TextEdit"
				if not (exists document log_name) then
					make new document with properties {name:log_name}
				end if
				make new paragraph at end of document log_name with data (the_text & my _linefeed)
			end tell
			return
		end _write
	end script
end make_textedit_log


