class ListsController < ApplicationController

  respond_to :html, :json
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List was successfully created.'
    end
    respond_with(@list)
  end

  def update
    if @list.update(list_params)
      flash[:notice] = 'List was successfully updated.'
    end
    respond_with(@list)
  end

  def destroy
    @list.destroy
    flash[:notice] = "Successfully destroyed List."
    respond_with(@list)
  end

  private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
