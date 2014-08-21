json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :preview, :full_script
  json.url movie_url(movie, format: :json)
end
