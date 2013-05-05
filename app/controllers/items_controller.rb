class ItemsController < ApplicationController

  respond_to :html, :json
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'Item was successfully created.'
    end
    respond_with(@item)
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated.'
    end
    respond_with(@item)
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully destroyed Item."
    respond_with(@item)
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name)
    end

end
