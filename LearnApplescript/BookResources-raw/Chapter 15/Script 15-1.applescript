try
	display dialog "What's next?" buttons {"Cancel", "Go", "Run"}
on error
	display dialog "I'm out of here..." giving up after 5
end try


