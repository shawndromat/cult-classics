require 'csv'
require 'active_support'
require 'active_support/inflector'

class MovieDataReader

  TITLE_IDX = 1
  RATING_IDX = 3
  NUM_RATINGS_IDX = 4

  def self.read(filename)
    lines = CSV.read(filename, col_sep: " +++$+++ ")

    lines.map do |line|
      {
        title: line[TITLE_IDX].titleize,
        average_rating: line[RATING_IDX].to_f,
        num_ratings: line[NUM_RATINGS_IDX].to_i
      }
    end
  end
end
