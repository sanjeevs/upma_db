class UpanishadsController < ApplicationController

  def show
    @upanishad = Upanishad.find(params[:id])
    @verses = @upanishad.verses.paginate(page: params[:page])
  end

  def index
   @upanishads = Upanishad.paginate(page: params[:page]) 
  end
end
