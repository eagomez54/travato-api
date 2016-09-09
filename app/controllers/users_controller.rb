class UsersController < ApplicationController
  def show
    @user = User.includes(:itinerary_users).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @user }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path(current_user)
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: { "ok": "false", "details": "update failed"} }
      end
    end
  end
end
