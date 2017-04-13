json.extract! election, :id, :name, :info, :start, :end, :max_votes, :created_at, :updated_at
json.url election_url(election, format: :json)
