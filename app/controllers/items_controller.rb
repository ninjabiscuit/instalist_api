class ItemsController < ApiController

  def index
    render json: Item.where("list_id = ?", params[:list_id] )
  end

  def show
    render json: @item
  end

  def new
    render json: Item.new
  end

  def edit
    render json: @item
  end

  def create
    @item = List.find(params[:list_id]).items.build(item_params)
    if @item.save
      flash[:notice] = 'Item was successfully created.'
    end
    render json: @item
  end

  def update
    if @item.update(item_params)
      flash[:notice] = 'Item was successfully updated.'
    end
    render json: @item
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully destroyed Item."
    render json: @item
  end

  private

    def item_params
      params.require(:item).permit(:name, :list_id)
    end

end
