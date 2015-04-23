require 'rails_helper'

RSpec.describe Youtube::VideoScraper do
  before :each do
    @scraper = Youtube::VideoScraper.new('j1BTrT1NfCM')
  end

  it 'has id' do
    expect(@scraper.id).to eql('j1BTrT1NfCM')
  end

  it 'scraps title' do
    expect(@scraper.title).to eql('BLOK EKIPA (II), ODCINEK 41')
  end

  it 'scraps description' do
    expect(@scraper.description).to eql('SPInkafilmstudio zaprasza na 41. odcinek BLOK EKIPY! Subskrybuj kanał i daj się ponieść absurdowi! Obiecujemy w tym roku jeszcze bardziej Was rozśmieszać ;)Budujemy blokowisko na Instagramie! Wrzucajcie foty z hasztagiem #blokekipa2015! Szykujemy dla Was wypasione nagrody!fb: facebook.com/spinka.blokekipakoszulki: www.spinka.cupsell.pl')
  end

  it 'scraps published_at date' do
    expect(@scraper.published_at).to eql('06.01.2015')
  end

  it 'scraps category' do
    expect(@scraper.category).to eql('Film i animacja')
  end

  it 'scraps channel' do
    expect(@scraper.channel).to eql('SPInkafilmstudio')
  end

  it 'scraps other ids' do
    expect(@scraper.other_ids.size).to be > 0
  end
end
