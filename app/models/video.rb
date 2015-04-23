class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :youtube_id, presence: true
  validates :description, presence: true
  validates :published_at, presence: true
  validates :category, presence: true
  validates :channel, presence: true
end
