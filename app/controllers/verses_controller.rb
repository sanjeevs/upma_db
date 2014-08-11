class VersesController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy, :create, :new]
  def edit
    @verse = Verse.find(params[:id])
  end

  def update
    @verse = Verse.find(params[:id])
    if @verse.update_attributes(params[:verse])
      flash[:success] = 'Verse updated'
      redirect_to "/upanishads/" + @verse.upanishad_id.to_s + "#" + @verse.id.to_s
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

  def new
    @verse = Upanishad.find(params[:upanishad_id].to_i).verses.build
    @verse.position = params[:position].to_i + 1

  end

  def show
  end
    
  def create
    @verse = Verse.new(params[:verse])
    @verse.upanishad_id = params[:upanishad_id].to_i
    @verse.position = params[:position].to_i
    if @verse.save
      redirect_to "/upanishads/" + @verse.upanishad_id.to_s + "#" + @verse.id.to_s
    else  
      render 'show'
    end
  end
end
