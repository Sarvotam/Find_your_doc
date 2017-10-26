json.extract! review, :id, :wait_time_rating, :bedside_manner_rating, :overall_rating, :review, :is_recommended, :created_at, :updated_at
json.url review_url(review, format: :json)
