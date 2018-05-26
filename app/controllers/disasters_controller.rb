class DisastersController < ApplicationController
  def index
    @disasters = DisasterSearch.new.all
  end

  def show
  end
end
