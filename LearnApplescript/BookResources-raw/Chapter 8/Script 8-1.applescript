set is_applicant_approved to ¬
	age ≥ 18 and ¬
	((bankruptcies = 0 and credit_rating > 700 and debt < 20000) ¬
		or (bankruptcies = 0 and credit_rating > 500 and debt < 10000)) ¬
		or (bankruptcies = 0 and debt > 1000 and will_give_up_first_born)



