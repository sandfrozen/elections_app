json.extract! election_user, :id, :vote, :user_id, :election_id, :created_at, :updated_at
json.url election_user_url(election_user, format: :json)
