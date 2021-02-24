class Users::UsersController < Users::ApplicationController
  def edit
  end

  def show
    @user = current_user
  end
end
