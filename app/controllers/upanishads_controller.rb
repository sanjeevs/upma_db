class UpanishadsController < ApplicationController

  def show
    @upanishad = Upanishad.find(params[:id])
    #@verses = @upanishad.verses.paginate(page: params[:page])
    @verses = @upanishad.verses.all
  end

  def index
   @upanishads = Upanishad.paginate(page: params[:page]) 
  end
end
