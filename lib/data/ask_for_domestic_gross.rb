def ask_for_domestic_gross(movie_title, year)
  puts "Enter gross for: #{movie_title} (#{year})"
  string_gross = STDIN.gets.chomp
  string_gross.split(",").join.to_i
end
