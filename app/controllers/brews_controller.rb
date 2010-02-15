class BrewsController < ApplicationController
  uses_tiny_mce
  
  before_filter :require_user
  before_filter :get_brew, :only => [:show, :update, :destroy, :create_note, :destroy_note]
  
  def index
    @brews = @current_user.brews
  end
  
  def show
    @brewnote = Brewnote.new # Was hoping to use @brew.brewnotes.build, but it threw immediate validation errors
    @brewnote.brew_id = @brew.id
  end

  def create
    @brew = @current_user.brews.build(params[:brew])
    if @brew.save
      flash[:notice] = 'Your brew has been created.'
      redirect_to @brew
    else
      @brews = @current_user.brews
      render :index
    end
  end
  
  def create_note
    @brewnote = @brew.brewnotes.build(params[:brewnote])
    if @brewnote.save
      flash[:notice] = 'Your note has been created.'
      redirect_to brew_path(@brew)
    else
      render :show
    end
  end

  def update
    if @brew.update_attributes(params[:brew])
      flash[:notice] = 'Your brew has been updated.'
      redirect_to @brew
    else
      render :action => :edit
    end
  end
  
  def destroy
    @brew.destroy
    redirect_to brews_path
  end
  
  private
  def get_brew
    @brew = @current_user.brews.find(params[:id])
  end
end
