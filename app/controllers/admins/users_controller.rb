class Admins::UsersController < Admins::ApplicationController
  def index
    if params[:search]
      @search = params[:search]
      @users = User.where('name LIKE ?', "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admins_user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :postal_code, :address, :email, :status)
  end
end
