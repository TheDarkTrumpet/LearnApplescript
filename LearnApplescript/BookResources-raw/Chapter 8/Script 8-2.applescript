 on round_to_decimal_places(the_number_to_round, the_decimal_precision)
	 set multiplier to 10 ^ the_decimal_precision
	 the_number_to_round * multiplier
	 round result
	 return result / multiplier
 end round_to_decimal_places


