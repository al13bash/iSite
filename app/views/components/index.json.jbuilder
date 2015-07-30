json.array!(@components) do |component|
  json.extract! component, :id, :data, :position, :site_id
  json.url component_url(component, format: :json)
end
