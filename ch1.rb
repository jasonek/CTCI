require 'pry'

# 1.1
class String
  def is_unique?
    result = true
    hsh = {}

    self.each_char do |x|
      if hsh[x] == 'fg'
        result = false
        break
      else
        hsh[x] = "fg"
      end
    end
    hsh
  # result
  end
end

# p "yowzers".is_unique?

# 1.2
class String
  def is_permut?(other_string)
    result = false
    return (p result) if self.length != other_string.length

    string1 = self.split('').sort_by {|char| char}
    string2 = other_string.split('').sort_by {|char| char}
    (result = true) if string1 === string2
    result
  end
end


# p "power".is_permut?('poerw')

# 1.6
class String
  def compress
    hsh = {}
    self.each_char do |char|
      if hsh[char]
        hsh[char] += 1
      else
        hsh[char] = 1
      end
    end
    # hsh
    new_string = hsh.to_a.flatten.join('')

    new_string.length > self.length ? self : new_string
  end
end

p "aabcccccaaa".compress

def method(string)
  count = 1
  for [0..string.length-1]
    if string[i] == string[i+1]
      count += 1
    else
      count = 1
    end
  end
end
