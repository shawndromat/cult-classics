require_relative "../lib/data/movie_data_reader"
require_relative "../lib/data/box_office_fetcher"
require_relative "../lib/data/ask_for_domestic_gross"

movies = MovieDataReader.read("lib/data/movie_titles_metadata.csv")
movies.each do |movie|
  record = Movie.find_or_create_by(title: movie[:title])
  movie[:domestic_gross] = record.domestic_gross ||
    BoxOfficeFetcher.fetch(movie[:title]) ||
    ask_for_domestic_gross(movie[:title], movie[:year])
  record.update(movie)
end
