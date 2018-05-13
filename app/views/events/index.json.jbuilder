json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.location event.location
  json.color event.color
  json.public event.public
  json.set! :start, event.start
  json.set! :end, event.end
end
