class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
<<<<<<< HEAD
  before_filter :admin_user,     only: :destroy

  
  def index
        @users = User.paginate(page: params[:page])
  end
=======
>>>>>>> continue-chapter9

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
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

<<<<<<< HEAD
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


   def update
    if @user.update_attributes(params[:user])
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
=======
  private

   def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
>>>>>>> continue-chapter9
      @user = User.find(params[:id])
      redirect_to(home_url) unless current_user?(@user)
    end

<<<<<<< HEAD
     def admin_user
      redirect_to(home_url) unless current_user.admin?
    end

=======
>>>>>>> continue-chapter9

end
