class UsersController < ApplicationController
  before_filter :load_user, :only => [:show, :edit, :update]
  access_control do
    allow anonymous, :to => [:show, :new, :create, :confirm]
    allow logged_in, :to => [:show, :confirm]
    allow :owner, :of => :user, :to => [:edit, :update]
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = current_user
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Your account has been created.'
      redirect_to @user
    else
      render :action => :new
    end
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Your profile has been updated.'
      redirect_to @user
    else
      render :action => :edit
    end
  end
  
  def confirm
    begin
      @user = User.find_using_perishable_token!(params[:token])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Sorry, that code is not valid."
      redirect_to '/'
      return
    end
    # This if-block should not be necessary, but let's be safe.
    if @user.id == params[:id].to_i
      @user.confirm_email!
      flash[:notice] = "Your email address has been confirmed as " + @user.email.to_s + "."
      redirect_to '/'
      return
    else
      flash[:notice] = "Sorry, that code is not valid."
      redirect_to '/'
      return
    end
  end
  
  private
  def load_user
    @user = User.find(params[:id])
  end
end
