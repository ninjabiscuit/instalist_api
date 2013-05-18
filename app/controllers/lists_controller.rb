class ListsController < ApiController

  def index
    render json: List.all
  end

  def show
    render json: @list
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List was successfully created.'
    end
    render json: @list
  end

  def update
    if @list.update(list_params)
      flash[:notice] = 'List was successfully updated.'
    end
    render json: @list
  end

  def destroy
    @list.destroy
    flash[:notice] = "Successfully destroyed List."
    render json: @list
  end

  private

    def list_params
      params.require(:list).permit(:name)
    end
end
