json.extract! election_candidate, :id, :party, :list, :place, :user_id, :election_id, :created_at, :updated_at
json.url election_candidate_url(election_candidate, format: :json)
