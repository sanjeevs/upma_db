class VersesController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
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
end
