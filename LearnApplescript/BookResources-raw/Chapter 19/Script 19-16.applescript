on make_null_log()
	script NullLog
		property class : "null log"
		property parent : make_log_base()
		
		on _write(the_text)
		end _write -- Did nothing!
	end script
end make_null_log


