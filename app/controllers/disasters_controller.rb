class DisastersController < ApplicationController
  def index
    @disasters = DisastersService.new.disasters
  end

  def show
    @disaster = DisasterService.new(params[:id]).disaster
  end
end
