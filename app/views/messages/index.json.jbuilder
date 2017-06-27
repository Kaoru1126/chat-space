json.messages @messages.each do |message|
  json.body         message.body
  json.image        message.image
  json.userName     message.user.name
  json.createdAt    message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.id           message.id
end
