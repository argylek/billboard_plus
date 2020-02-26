class BillboardsController < ApplicationController
  before_action :set_user
  before_action :set_billboard, only: [:show, :edit, :update, :destroy]
  def index
    @billboards = current_user.billboard
  end

  def new
    @billboard
  end

  def show
  end

  def edit
  end

  private

  def set_user
  end

  def set_billboard
    @billboard = current_user.billboard.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:name, :region)
  end

end
