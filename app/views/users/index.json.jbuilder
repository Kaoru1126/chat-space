json.array! @users do |user|
  json.id          user.id
  json.names       user.name
end

