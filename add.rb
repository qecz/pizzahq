hh = {}

loop do

print "Enter product id"
id = gets.chomp

print "Enter amount"
n = gets.chomp.to_i

hh[id]=hh[id].to_i + n

puts hh.inspect

total = 0

hh.each do |key, value|

total = total + value.to_i

end

puts "Total #{total}"  

end