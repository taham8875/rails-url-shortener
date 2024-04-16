require 'open-uri'

class Metadata

  def self.retrieve_from(url)
    html = URI.open(url)
    new(html)
  rescue
    new
  end

  def initialize(html=nil)
    @doc = Nokogiri::HTML(html)
  end

  def attributes
    {
      title: title,
      description: description,
      image: image
    }
  end

  def title
    @doc.at_css('title')&.text
  end

  def description
    @doc.at_css('meta[name="description"]')&.attributes&.fetch('content', nil)&.text
  end

  def image
    @doc.at_css('meta[property="og:image"]')&.attributes&.fetch('content', nil)&.text
  end
end
