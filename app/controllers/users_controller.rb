class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  
  def index
        @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end


  def new
  	@user = User.new
  end

   def edit
    @user = User.find(params[:id])
  end    

  def create
    @user = User.new(params[:user])    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


   def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

     def correct_user
      @user = User.find(params[:id])
      redirect_to(home_url) unless current_user?(@user)
    end

     def admin_user
      redirect_to(home_url) unless current_user.admin?
    end


end
