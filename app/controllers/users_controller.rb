class UsersController < ApplicationController
authorize_resource

  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
    respond_with @users
  end
  def show
    @user = User.find(params[:id])

    @one = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
    respond_with @user
  end
end
