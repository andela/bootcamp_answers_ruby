require 'byebug'

class Array
  def new_flatten
    a = []
    self.each do |element|
      if element.is_a? Array
        a += element.new_flatten
      else
        a << element
      end
    end
    a
  end
end

[1,2,3] + [4,5,6]
test_array = ([1,2,3,[4,5,6,[7]]])
puts test_array.new_flatten == test_array.flatten

# Solution with gsub
# array.to_s.gsub(/\[|\]/,'').split(", ").map {|str| str.to_i}
# or 
# array.to_s.delete([]).split(", ").map {|str| str.to_i}
