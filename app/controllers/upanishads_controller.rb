class UpanishadsController < ApplicationController
  def show
    @upanishads = Upanishad.new(params[:id])
  end

  def index
   @upanishads = Upanishad.paginate(page: params[:page]) 
  end
end
