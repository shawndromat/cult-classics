class Movie
  attr_reader :title, :average_rating, :num_ratings

  def initialize(title:, average_rating:, num_ratings:)
    @title = title
    @average_rating = average_rating
    @num_ratings = num_ratings
  end
end
