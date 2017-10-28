class CollaboratorsController < ApplicationController

  def index
    @collaborators = Collaborator.all

  def new
    @collaborator = @wiki.collaborators.new(user_id: params[:user_id])
    @collaborator.save
    #@wiki = Wiki.find()
#@wiki.collaboration_user_ids = []
#@wiki.save
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
