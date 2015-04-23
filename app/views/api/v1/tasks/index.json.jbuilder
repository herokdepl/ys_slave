json.array! @tasks do |task|
  json.id task.id
  json.action task.action
  json.argument task.argument
end
