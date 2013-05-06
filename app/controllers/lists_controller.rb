class ListsController < ApplicationController

  respond_to :html, :api_v1
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :default_response, except: [:index]

  def index
    @lists = List.all
    respond_with(@lists)
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
  end

  def update
    if @list.update(list_params)
      flash[:notice] = 'List was successfully updated.'
    end
  end

  def destroy
    @list.destroy
    flash[:notice] = "Successfully destroyed List."
  end

  private

    def default_response
      respond_with(@list)
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
