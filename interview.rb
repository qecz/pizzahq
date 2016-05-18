f = File.open('test.txt')

@hh={}

def addtohash word
  if !word.empty?
    word.downcase!
    cnt = @hh[word].to_i
    cnt += 1
    @hh[word]=cnt
  end  
end

f.each_line do |line|
  arr = line.split(/\s|\n|\.|\,/)
  arr.each{|word| addtohash(word)}
end
f.close

#puts @hh.inspect
@hh.each do |k,v| 
  puts "#{v} #{k}"
end 