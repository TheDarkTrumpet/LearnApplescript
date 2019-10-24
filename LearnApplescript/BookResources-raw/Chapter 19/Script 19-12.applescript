script VisualHello
	on say_hello(the_greeting)
		display alert "Visual object says " & the_greeting
	end say_hello
end script

script AudioHello
	on say_hello(the_greeting)
		say "Audio object says " & the_greeting
	end say_hello
end script

repeat with hello_obj in {VisualHello, AudioHello}
	tell hello_obj to say_hello("Yo-ho-ho!")
end repeat


