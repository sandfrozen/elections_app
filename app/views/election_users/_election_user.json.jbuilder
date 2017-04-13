json.extract! election_user, :id, :vote, :User_id, :Election_id, :created_at, :updated_at
json.url election_user_url(election_user, format: :json)
