require "pry"

def permute_string(string, result_array, i=0)
  substr = string[0..i]
  next_char = string[i+1]
  if i==0
    result_array << string[0]
    result_array << string[0..1]
    result_array << string[1] + string[0]
  else
    result = (0..i+1).map(&:to_i).reverse.map {|idx| p inject_char(substr,next_char,idx) }
    result_array << result
  end

  # binding.pry
  i += 1

  if i == (string.length-1)
    return result
  else
    permute_string(string, result_array, i)
  end
end


def inject_char(string, char, index)
  if index == 0
    return "#{char}" + string
  else
    first_piece = string[0..index-1]
    last_piece = string[index..-1]
    return first_piece + "#{char}" + last_piece
  end
end

# p inject_char("ct",'s',1)

# tot_res = Array.new
# permute_string("string", tot_res)
# p tot_res.flatten


require 'set'

def get_permutations(string)

  # base case
  if string.length <= 1
      return Set.new [string]
  end

  all_chars_except_last = string[0..-2]
  last_char = string[-1]

  # recursive call: get all possible permutations for all chars except last
  permutations_of_all_chars_except_last = get_permutations(all_chars_except_last)

  # put the last char in all possible positions for each of the above permutations
  permutations = Set.new
  permutations_of_all_chars_except_last.each do |permutation_of_all_chars_except_last|
      (0..all_chars_except_last.length).each do |position|
          permutation = permutation_of_all_chars_except_last[0...position] + last_char + permutation_of_all_chars_except_last[position..-1]
          permutations.add(permutation)
      end
  end

  return permutations
end

p get_permutations("string").count
