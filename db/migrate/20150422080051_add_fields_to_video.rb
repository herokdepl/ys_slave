class AddFieldsToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :youtube_id, :string, null: false
    add_column :videos, :description, :text, null: false
    add_column :videos, :published_at, :date, null: false
    add_column :videos, :category, :string, null: false
    add_column :videos, :channel, :string, null: false
  end
end
