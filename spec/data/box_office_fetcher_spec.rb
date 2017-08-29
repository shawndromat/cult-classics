require 'spec_helper'
require_relative '../../lib/data/box_office_fetcher'

describe BoxOfficeFetcher do
  let(:http_client) { spy(:http_client) }

  it 'should hit the right box office mojo url' do
    uri = BoxOfficeFetcher.box_office_direct_uri('10 Things I Hate About You')
    expect(uri).to eq "http://www.boxofficemojo.com/movies/?id=10ThingsIHateAboutYou.htm"
  end

  it 'should return the right value' do
    expect(BoxOfficeFetcher.fetch('10 Things I Hate About You')).to eq 38_178_166
  end

  it 'should handle punctuation in title' do
    expect(BoxOfficeFetcher.fetch('L.A. Confidential')).to eq 64_616_940
  end

  it 'tries to omit the leading "the" in the title' do
    expect(BoxOfficeFetcher.fetch('The Fifth Element')).to eq 63_820_180
  end

  it 'searches for the title if no exact match' do
    expect(BoxOfficeFetcher.fetch('Star Trek Iv: The Voyage Home')).to eq 109_713_132
  end

  context 'when the movie does not exist' do
    it 'returns nil' do
      expect(BoxOfficeFetcher.fetch('Shawna is the best')).to eq nil
    end
  end
end
