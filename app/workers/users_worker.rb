require "get_user"



class UsersWorker
  include Sidekiq::Worker

  def perform()
    @offset = 0
    @limit = 100
    @api_key = ENV["api_key"]
    @base_url = ENV["base_url"]
    @user = UserUtil.new(@base_url, @api_key)
    @allUsers = Array.new()
    users = @user.getUsers( offset:@offset, limit:@limit)
    if users.length>0
   
      @allUsers.concat(@user.getUsers( offset:@offset, limit:@limit+1))
     
    end
    if !@allUsers.nil?
      @allUsers.map do |user|
        @user_saved = User.find_or_create_by(id: user["id"]) do |current_user|
          current_user.first_name = user["first_name"]
          current_user.last_name = user["last_name"]
          current_user.status = user["status"]
          current_user.email = user["email"]
          current_user.created_at = user["created_at"]
          current_user.id = user["id"]
        end

        puts @user_saved
      end
    end

  end
end


