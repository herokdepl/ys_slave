class Youtube::SearchScraper
  def initialize(keywords)
    keywords.gsub!(/ /, '+')
    @page = Nokogiri::HTML(open("https://www.youtube.com/results?search_query=#{keywords}").read)
  end

  def ids
    @page.css('.yt-uix-tile-link').map do |element|
      match = element['href'].scan(/\/watch\?v=(.+)/)
      match[0][0] if match.present?
    end.compact
  end
end
