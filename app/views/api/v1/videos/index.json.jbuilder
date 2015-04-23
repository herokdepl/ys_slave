json.array! @videos do |video|
  json.id video.id
  json.title video.title
  json.youtube_id video.youtube_id
  json.description video.description
  json.published_at video.published_at
  json.category video.category
  json.channel video.channel
end
