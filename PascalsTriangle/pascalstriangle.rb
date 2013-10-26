#!/usr/bin/ruby1.9.1

def compute_row(n)

	return nil unless n.is_a? Fixnum
  
	return [1] if n == 1
  
	arr = Array.new(n) { |x| 1 }
  
  (1..(n-2)).each do |i|
  	
  	fact1 = 1
  	fact2 = 1
  	fact3 = 1
  	for j in (1..(n-1)) do
  		fact1 *= j
  		fact2 *= j if j <= i
  		fact3 *= j if j <= n-1-i
  	end
  	
  	arr[i] = (fact1 / (fact2 * fact3))
  	
  end
  
  return arr
  
end

puts compute_row(2).to_s

