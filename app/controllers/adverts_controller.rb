class AdvertsController < ApplicationController
  before_action :advert , only: [:show, :edit, :destroy, :update]
  before_action :authenticate_user!, only: [:new]

  def index
    respond_with (@adverts = Advert.all)
  end
  def edit
    respond_with @advert
  end
  def new
    respond_with (@advert = Advert.new)
  end
  def create
    respond_with @advert = current_user.adverts.create(set_params)
  end
  def show
    respond_with @advert
  end
  def update
    @advert.update(set_params)
    respond_with @advert
  end
  def destroy
    respond_with @advert.destroy
  end
  private
  def advert
    @advert = Advert.find(params[:id])
  end
  def set_params
    params.require(:advert).permit(:title, :body, :user_id)
  end
end
