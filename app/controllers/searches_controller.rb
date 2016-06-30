class SearchesController < ApplicationController

  def new
    @search = Search.new
    # passing each category from the restaurant model
    categories
  end

  def create
    # add user's search in the url
    redirect_to "/restaurants/result?people=#{params[:search][:people]}&category=#{params[:search][:category]}"
  end

  # def show
  #   @search = Search.find(params[:id])
  # end


  private

  def search_params
    params.require(:search).permit(:category, :min_price, :max_price, :people, :time, :hour, :location)
  end

  def categories
    @categories = Restaurant.uniq.pluck(:category)
  end

end
