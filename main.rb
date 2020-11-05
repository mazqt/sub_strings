require "byebug"

def substrings(string, dictionary)
    results = Hash.new(0)
    words = string.split(" ")

    words.each do |word|
        word.each_char.with_index do |letter, index|
            (word.length - index).times do |i|
               if dictionary.include?(word[index..(i + index)].downcase)
                    results[word[index..(i + index)].downcase] += 1
               end
            end
        end
    end

    p results
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
 ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
# expected result { "below" => 1, "low" => 1}

substrings("Howdy partner, sit down! How's it going?", dictionary)
# expected result { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }