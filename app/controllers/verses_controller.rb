class VersesController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy]
  def edit
    @verse = Verse.find(params[:id])
  end

  def update
    @verse = Verse.find(params[:id])
    if @verse.update_attributes(params[:verse])
      flash[:success] = 'Verse updated'
      redirect_to Upanishad.find(@verse.upanishad_id) 
    else
      render 'edit'
    end
  end

  def destroy
    verse = Verse.find(params[:id])
    upanishad_id = verse.upanishad.id
    verse.destroy
    redirect_to Upanishad.find(upanishad_id) 
  end

end
