json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :name, :text
  json.url article_url(article, format: :json)
end
