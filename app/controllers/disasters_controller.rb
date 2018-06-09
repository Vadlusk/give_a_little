class DisastersController < ApplicationController
  def index
    @disasters = DisastersSearch.new.disasters
  end

  def show
    @disaster = DisasterSearch.new(params[:id]).disaster
  end
end
