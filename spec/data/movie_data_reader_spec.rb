require 'spec_helper'
require_relative '../../lib/data/movie_data_reader'
require_relative '../../lib/data/movie'

describe MovieDataReader do
  let(:filename) { File.expand_path('lib/data/movie_titles_metadata.csv') }

  let(:movies) { MovieDataReader.read(filename, Movie) }

  it 'reads the movies from a file' do
    expect(movies.size).to eq 617
  end

  it 'returns movie objects' do
    ten_things = movies.first

    expect(ten_things.title).to eq "10 Things I Hate About You"
    expect(ten_things.average_rating).to eq 6.9
    expect(ten_things.num_ratings).to eq 62_847
  end
end
