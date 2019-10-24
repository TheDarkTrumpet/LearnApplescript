on do_math(a, b, the_operator)
	if the_operator is "+" then
		return a + b
	else if the_operator is "-" then
		return a - b
	else if the_operator is "*" then
		return a * b
	else
		error "Unknown operation."
	end if
end do_math


