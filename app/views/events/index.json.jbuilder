json.array!(@events) do |event|
  json.id event.id
  json.title event.title
  json.desc event.desc
  json.event_type event.event_type
  json.start event.start_time
  json.end event.end_time
  json.url event_url(event, format: :html)
end