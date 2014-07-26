class UsersController < ApplicationController
  before_filter :signed_in_admin, only: [:index, :destroy, :new, :create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to Upanishad Database"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User destroyed'
    redirect_to users_path
  end

  private
    def signed_in_admin
      redirect_to signin_path, notice: "Please sign in." unless admin?
    end
end
