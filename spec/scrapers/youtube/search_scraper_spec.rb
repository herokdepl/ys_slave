require 'rails_helper'

RSpec.describe Youtube::SearchScraper do
  before :each do
    @scraper = Youtube::SearchScraper.new('bonk')
  end

  it 'scraps ids' do
    expect(@scraper.ids.size).to be > 0
  end
end
