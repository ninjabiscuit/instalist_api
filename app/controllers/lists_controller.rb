class ListsController < ApplicationController

  respond_to :html, :api_v1
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
    respond_with(@lists)
  end

  def show
    respond_with(@list)
  end

  def new
    @list = List.new
    respond_with(@list)
  end

  def edit
    respond_with(@list)
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
