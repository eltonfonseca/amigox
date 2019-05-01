class RafflesController < ApplicationController

  before_action :authenticate_user!

  layout "group"
  
  def index
  end
end
