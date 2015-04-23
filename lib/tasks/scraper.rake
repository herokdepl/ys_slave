namespace :scraper do
  task scrap: :environment do
    Task.queue.first.perform!
  end
end
