class WikisController < ApplicationController

before_action :authenticate_user!
    def index
      @wikis = policy_scope(Wiki)
    end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    if @wiki.save
      flash[:notice] = "Wiki saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    if @wiki.save
      flash[:notice] = "Wiki was updated successfully"
      redirect_to @wiki
    else
      flash.now[:alerts]= "Errpr. Try again."
      render :edit
    end
  end

  def destroy
    authorize @wiki
    @wiki = find_id
    if @wiki.destroy
      flash[:notice] ="Deleted"
      redirect_to wikis_path
    else
      flash.now[:alert] = "Error"
      render :show
    end
  end
  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
  def find_id
    Wiki.find(params[:id])
  end
   def authorize_user
     wiki = Wiki.find(params[:id])
     unless current_user == wiki.user || current_user.admin?
       flash[:alert] = "You must be an admin, premium user or collaborator to do that."
       redirect_to wikis_path
     end
   end
end
