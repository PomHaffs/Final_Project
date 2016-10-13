class User < ActiveRecord::Base
  has_secure_password
  has_many :fridges
  require 'open-uri'

  def get_recipes( items )
    recipe_page =
    "http://www.taste.com.au/search-recipes/?q=#{items[0]}+#{items[1]}+#{items[2]}"

    recipe_doc = Nokogiri::HTML(open(recipe_page))
    @getrecipe = []

    recipe_doc.css(".content-item .story-block").each do |el|
      name = el.css("h3").text
      link = el.css(".main-link").attribute("href").to_s
      image_link = el.css(".thumbnail-link img").attribute("src").to_s
      @getrecipe.push({:name => name, :link => link, :image_link => image_link})
    end
    @getrecipe.first(8)
  end
end
