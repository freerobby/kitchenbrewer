class BrewnotesController < ApplicationController
  uses_tiny_mce
  before_filter :require_user
  before_filter :get_brewnote
  
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
  def get_brewnote
    b = Brewnote.find(params[:id])
    @brewnote = b if b.brew.user == @current_user
  end
end
