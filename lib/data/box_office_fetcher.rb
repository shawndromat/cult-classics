require 'nokogiri'
require 'open-uri'
require 'addressable/template'
require 'uri'

class BoxOfficeFetcher
  def self.fetch(movie_title)
    get_domestic_gross(movie_title) ||
      get_domestic_gross(title_without_the(movie_title)) ||
      search_for_domestic_gross(movie_title)
  end

  private

  def self.search_for_domestic_gross(movie_title)
    begin
      sanitized_title = URI.escape(movie_title)
      page = open_page(box_office_search_uri(sanitized_title))
      path = page.css('tr[bgcolor="#FFFF99"] a').first['href']
      page = open_page("http://www.boxofficemojo.com" + path)
      table = domestic_gross_table(page)
      domestic_gross_from_table(table)
    rescue
      nil
    end
  end

  def self.box_office_search_uri(movie_title)
    "http://www.boxofficemojo.com/search/?q=#{movie_title.split(' ').join}"
  end

  def self.title_without_the(movie_title)
    movie_title[4..-1] if movie_title[0..2].downcase == 'the'
  end

  def self.get_domestic_gross(movie_title)
    begin
      sanitized_title = movie_title.gsub(/\W/, "")
      page = open_page(box_office_direct_uri(sanitized_title))
      table = domestic_gross_table(page)
      domestic_gross_from_table(table)
    rescue
      nil
    end
  end

  def self.box_office_direct_uri(movie_title)
    "http://www.boxofficemojo.com/movies/?id=#{movie_title.split(' ').join}.htm"
  end

  def self.open_page(uri)
    Nokogiri::HTML(open(uri))
  end

  def self.domestic_gross_table(page)
    page.css("table table table")[1].content
  end

  def self.domestic_gross_from_table(table)
    match_data = /Domestic Total Gross: \$((\d+,)+\d+)\D/.match(table)
    match_data.captures.first.split(',').join.to_i
  end
end
