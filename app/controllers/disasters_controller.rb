class DisastersController < ApplicationController
  def index
    @disasters = DisastersSearch.new(params[:limit]).disasters
  end

  def show
    @disaster = DisasterSearch.new(params[:id]).disaster
  end
end
