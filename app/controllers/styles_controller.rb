class StylesController < ApplicationController
  def index
    @styles = Style.title_like(params[:search])
  end
end