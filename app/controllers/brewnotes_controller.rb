class BrewnotesController < ApplicationController
  before_filter :load_brewnote, :only => [:edit, :update, :destroy]
  access_control do
    allow :owner, :of => :brewnote, :to => [:edit, :update, :destroy]
  end
  uses_tiny_mce
  
  def edit
  end
  
  def update
    if @brewnote.update_attributes(params[:brewnote])
      flash[:notice] = 'Your note has been updated.'
      redirect_to brew_path(@brewnote.brew)
    else
      render :action => :edit
    end
  end
  
  def destroy
    brew = @brewnote.brew
    @brewnote.destroy
    respond_to do |format|
      format.html {redirect_to brew_path(brew)}
      format.js {render :text => "<p>This entry has been deleted.</p>"}
    end
  end
  
  private
  def load_brewnote
    @brewnote = Brewnote.find(params[:id])
  end
end
