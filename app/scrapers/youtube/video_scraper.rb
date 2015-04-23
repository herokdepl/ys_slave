class Youtube::VideoScraper
  attr_reader :id

  def initialize(id)
    @id = id
    @page = Nokogiri::HTML(open("https://www.youtube.com/watch?v=#{@id}").read)
  end

  def title
    @page.css('#eow-title').text.strip
  end

  def description
    @page.css('#eow-description').text.strip
  end

  def published_at
    @page.css('.watch-time-text').text.gsub(/Opublikowany/, '').strip
  end

  def category
    @page.css('#watch-description-extras').css('.g-hovercard').text.strip
  end

  def channel
    @page.css('#watch7-user-header').css('.g-hovercard').text.strip
  end

  def other_ids
    @page.css('.video-list-item a').map { |e| e['href'].scan(/\/watch\?v=(.+)/)[0][0] }
  end

  def video
    Video.new(title: title, description: description, published_at: published_at,
              category: category, channel: channel, youtube_id: id)
  end
end
