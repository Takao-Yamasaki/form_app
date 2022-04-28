class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @form = Form::ItemCollection.new
  end

  def create
    @form = Form::ItemCollection.new(item_collection_params)
    if @form.save
      redirect_to items_path, notice: '商品を登録しました。'
    else
      flash.now[:alert] = '商品の登録に失敗しました。'
      render :new
    end
  end

  private
  
  def item_collection_params
    params.require(:form_item_collection).permit(items_attributes: Form::Item::REGISTABLE_ATTRIBUTES)
  end
end
