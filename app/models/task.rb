class Task < ActiveRecord::Base
  validates :action, inclusion: {in: %w[SE SC]}
  validates :argument, presence: true

  scope :queue, -> { order(updated_at: :asc) }

  def self.create_search!(argument)
    Task.create!(action: 'SE', argument: argument)
  end

  def self.create_scrap!(argument)
    Task.create!(action: 'SC', argument: argument)
  end

  def perform!
    case action
    when 'SE'
      perform_search!
    when 'SC'
      perform_scrap!
    end
    destroy!
  end

  private

  def perform_search!
    scraper = Youtube::SearchScraper.new(argument)
    scraper.ids.each do |id|
      Task.create!(action: 'SC', argument: id)
    end
  end

  def perform_scrap!
    scraper = Youtube::VideoScraper.new(argument)
    scraper.video.save!
  end
end
