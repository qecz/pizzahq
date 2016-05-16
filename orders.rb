orders = "product_1=5,product_2=8,product_3=2,"
s1 = orders.split(/,/)
puts s1.inspect
s1.each do |s|
	s2 = s.split(/\=/)
	s3=s2[0].split(/_/)
	key=s3[1]
	value=s2[1]
	puts "Prod #{key} - #{value}"
end