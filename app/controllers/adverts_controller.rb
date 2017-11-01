class AdvertsController < ApplicationController
  def index
    respond_with (@adverts = Advert.all)
  end
end
