# require 'open-uri'
# require 'nokogiri'


# # def initialize(location)

# url = "https://www.eventbrite.co.uk/d/united-kingdom--london/arts--events--this-week/"
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# results =[]
# html_doc.search(".search-event-card-wrapper").first(10).each do |element|
#   link = element.search(".eds-media-card-content__action-link").attribute('href')

#   location = element.search(".card-text--truncated__one").text

#   date = element.search(".eds-text-color--primary-brand").text.split("+")[0]

#   sold = element.search(".eds-media-card-content__flag").text

#   results << { link: link, location: location, sold: sold }
# end



  #Link for image
  # html_doc.search(".eds-media-card-content__action-link").each do |element|
  #   @links = element.attribute('href')
  # end

  # #Location
  # html_doc.search(".card-text--truncated__one").each do |element|
  #   @locations = element.text
  # end

  # #Location and price
  # html_doc.search(".eds-media-card-content__sub-content").each do |element|
  #   @location_prices = element.text
  # end

  # # Date
  # html_doc.search(".eds-text-color--primary-brand").each do |element|
  #   @dates = element.text
  # end

  # If sold out

  # html_doc.search(".eds-media-card-content__flag").each do |element|
  #   # puts element.text
  #   puts " "
  #   # puts element.text.strip
  #   puts element.text
  #   puts " "
  # end
# end




