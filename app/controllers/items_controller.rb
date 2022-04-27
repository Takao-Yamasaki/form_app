class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = ItemForm.new
  end

  def create
    @item = ItemFrom.new(item_price)
    if @item.save
      redirect_to items_path, notice: '商品を登録しました。'
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:code, :item, :price)
  end
end
