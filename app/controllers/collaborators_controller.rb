class CollaboratorsController < ApplicationController

  def index
    @collaborators = Collaborator.all

  def new
    @wiki = Wiki.find(789)
@wiki.collaboration_user_ids = [123, 456]
@wiki.save
 end

  def show
    @wiki = Wiki.find(params[:id])
    authorize Collaborator
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize Collaborator
  end
    def update
      authorize Collaborator
      @wiki = Wiki.find(params[:id])
      collaborator = Collaborator.where(wiki_id: @wiki.id)
      collaboratiors.each do |collaborator|
      collaborator.destroy!
    end
      if @wiki.destroy
        flash[:notice] = "Collaborator was deleted successfully"
        redirect_to @wiki
      else
        flash.now[:alerts]= "Error. Try again."
        render :edit
      end
    end

    def destroy
  @collaborator.destroy!
   end
  end
end
