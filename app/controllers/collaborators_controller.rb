class CollaboratorsController < ApplicationController

def index
end

  def new
    @collaborator = Collaborator.new
    @user = User.all
    @wiki = Wiki.new
    @wiki = Wiki.find_by_id(params[:id])


#@wiki.collaboration_user_ids = []
#@wiki.save
 end

  def show
    @collaborator = Collaborator.find_by_id(params[:id])


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


        def create
          @wiki = Wiki.find_by_id(params[:wiki_id])
          @collaborator = Collaborator.new(user_id: params[:user_id], wiki_id: params[:wiki_id])
       if @collaborator.save
          flash[:notice] = "Congrats you have added a new collab"
        else
          flash[:error] = "Problem. Please try again"
          render :new
        end


    def destroy
  @collaborator.destroy!
   end
  end
end
