class CharitiesController < ApplicationController
  def index
    @charities = CharitiesSearch.new(params[:type]).charities
  end
end
