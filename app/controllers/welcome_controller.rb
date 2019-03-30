class WelcomeController < ApplicationController
  def index
    widget = Widget.new(params[:donuts_url], params[:cronuts_url])
    @cronut_url = widget.cronuts_url
    @donut_url  = widget.donuts_url
  end
end
