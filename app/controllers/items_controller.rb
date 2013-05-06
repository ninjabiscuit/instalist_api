class ItemsController < ApplicationController

  respond_to :html, :api_v1
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_list
  before_action :default_response, except: [:index]

  def index
    @items = @list.items
    respond_with(@items)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = @list.items.build(item_params)
    if @item.save
      flash[:notice] = 'Item was successfully created.'
    end
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated.'
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully destroyed Item."
  end

  private

    def default_response
      respond_with(@list, @item)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def item_params
      params.require(:item).permit(:name, :list_id)
    end

end
