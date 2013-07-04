json.array!(@users) do |user|
  json.extract! user, :firstName, :lastName, :email, :mobile, :landline, :twitter, :photo
  json.url user_url(user, format: :json)
end
