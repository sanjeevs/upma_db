class MicropostsController < ApplicationController
  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def index
    @microposts = Micropost.paginate(page: params[:page])
  end

  def create
    @micropost = Micropost.new(params[:micropost])
    if @micropost.save
      flash[:success] = "Created new post"
      redirect_to @micropost
    else
      render 'new'
    end
  end

end
