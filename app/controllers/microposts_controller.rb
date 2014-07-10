class MicropostsController < ApplicationController
<<<<<<< HEAD
   before_filter :signed_in_user, only: [:create, :destroy]
   before_filter :correct_user,   only: :destroy

   def create
=======
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
  end

 def create
>>>>>>> chapter11-complete
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to home_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

   def destroy
    @micropost.destroy
    redirect_to home_url
  end

  private

<<<<<<< HEAD
    #def micropost_params
      #params.require(:micropost).permit(:content)
    #end

    def correct_user
=======
   def correct_user
>>>>>>> chapter11-complete
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end

<<<<<<< HEAD
=======

>>>>>>> chapter11-complete
end