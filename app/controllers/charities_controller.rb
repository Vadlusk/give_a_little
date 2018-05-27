class CharitiesController < ApplicationController
  def index
    @charities = CharitiesService.new(params[:type]).charities
  end
end
