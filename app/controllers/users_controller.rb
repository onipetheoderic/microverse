class UsersController < ApplicationController
  def index
    status = params[:status]
    userInstance = User
    users = userInstance.paginate(:page => params[:page], :per_page => 10) if status === "all"
    users = userInstance.where(status: "Active") if status === "Active"
    users = userInstance.where(status: "Inactive") if status === "Inactive"
    users = userInstance.paginate(:page => params[:page], :per_page => 10) if !status
    @users = users.paginate(:page => params[:page], :per_page => 10)
    @status=status
  end

end
