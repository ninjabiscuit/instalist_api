class ItemsController < ApplicationController

  respond_to :html, :api_v1
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_list

  def index
    @items = @list.items
    respond_with(@list, @items)
  end

  def show
    respond_with(@list, @item)
  end

  def new
    @item = Item.new
    respond_with(@list, @item)
  end

  def edit
    respond_with(@list, @item)
  end

  def create
    @item = @list.items.build(item_params)
    if @item.save
      flash[:notice] = 'Item was successfully created.'
    end
    respond_with(@list, @item)
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated.'
    end
    respond_with(@list, @item)
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully destroyed Item."
    respond_with(@list, @item)
  end

  private

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
