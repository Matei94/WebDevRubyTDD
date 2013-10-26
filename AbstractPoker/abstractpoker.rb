#!/usr/bin/ruby1.9.1

def classify_poker_hand(poker_hand)

	return :not_a_ruby_array unless poker_hand.is_a? Array

	return :too_many_or_too_few_cards unless poker_hand.length == 5

	poker_hand.each do |x|
		return :at_least_one_card_is_not_an_integer unless x.is_a? Fixnum
	end

	poker_hand.sort!
	
	pairs = 0
	succesive = 0
	last = -1
	last_but_one = -2
	three_of_a_kind = 0
	
	poker_hand.each do |x|
		return :at_least_one_card_is_out_of_bounds if x < 1 || x > 1000
		three_of_a_kind += 1 if x == last && x == last_but_one
		pairs += 1 if x == last
		succesive += 1 if x == last+1
		last_but_one = last
		last = x
	end
	
	return :four_of_a_kind if three_of_a_kind == 2 && pairs == 3
	return :full_house if three_of_a_kind == 1 && pairs == 3
	return :three_of_a_kind if three_of_a_kind == 1
	return :straight if succesive == 4
	return :two_pairs if pairs == 2
	return :one_pair if pairs == 1
	return :high_card if succesive >= 2
	return :impossible_hand if pairs == 4
	return :valid_but_nothing_special
	
end

