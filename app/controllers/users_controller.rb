class UsersController < ApplicationController
authorize_resource

  def index
    respond_with @users = User.all
  end
  def show
    respond_with @user = User.find(params[:id])
  end
end
