require_relative "../lib/data/movie_data_reader"

movies = MovieDataReader.read("lib/data/movie_titles_metadata.csv", Movie)
movies.each(&:save)
