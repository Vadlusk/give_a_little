class DisastersController < ApplicationController
  def index
    @disasters = DisastersSearch.new(params[:limit], params[:type]).disasters
  end

  def show
    @disaster = DisasterSearch.new(params[:id]).disaster
  end
end
