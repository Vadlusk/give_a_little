class DisastersController < ApplicationController
  def index
    @disasters = DisasterService.new.disasters
  end

  def show; end
end
