json.body        @message.body
json.image       @message.image
json.userName    @message.user.name
json.createdAt   @message.created_at.strftime("%Y/%m/%d %H:%M:%S")
json.id          @message.id

