class BrewsController < ApplicationController
  before_filter :load_brew, :only => [:show, :update, :destroy, :create_note]
  access_control do
    allow anonymous, :to => [:show]
    allow logged_in, :to => [:index, :show, :create]
    allow :owner, :of => :brew, :to => [:update, :create_note, :destroy]
  end
  uses_tiny_mce
  
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
      @msg = 'Your brew has been updated.'
    end
    respond_to do |format|
      format.html {render :action => :edit}
      format.js {render :partial => "edit"}
    end
  end
  
  def destroy
    @brew.destroy
    redirect_to brews_path
  end
  
  private
  def load_brew
    @brew = Brew.find(params[:id])
  end
end
