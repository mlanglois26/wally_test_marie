class PagesController < ApplicationController

  def home
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end
end
