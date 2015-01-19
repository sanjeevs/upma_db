class MicropostsController < ApplicationController
  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
    @micropost.author = "Swami Chidananda"
    @micropost.published_at = Time.now
    @micropost.urn = "verse:0"
  end

  def index
    @microposts = Micropost.paginate(page: params[:page])
  end

  def create
    @micropost = Micropost.new(params[:micropost])
    @micropost.urn = "verse:0" if @micropost.urn.blank?
    m =  @micropost.urn.match(/\A\d+\z/)
    @micropost.urn = "verse:#{m[0]}" if m
    if @micropost.save
      flash[:success] = "Created new post"
      redirect_to @micropost
    else
      render 'new'
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(params[:micropost])
      flash[:success] = "Post Updated"
      redirect_to @micropost
    else
      render 'edit'
    end
  end
end
