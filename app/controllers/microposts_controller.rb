class MicropostsController < ApplicationController
   before_filter :signed_in_user, only: [:create, :destroy]

   def create
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
  end

  #private

    #def micropost_params
      #params.require(:micropost).permit(:content)
    #end
end