class LineItemDatesController < ApplicationController
  # 各アクションの実行前にset_quoteメソッドを実行
  before_action :set_quote
  before_action :set_line_item_date, only: [ :edit, :update, :destroy ]
  def new
    # 現在のquoteに紐づく新しいline_item_dateオブジェクトをビルド
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: "Date was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Date was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @line_item_date.update(line_item_date_params)
      redirect_to quote_path(@quote), notice: "Date was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy
    redirect_to quote_path(@quote), notice: "Date was successfully destroyed."
  end

  private

  # edit, update, destroyアクションの前に特定のline_item_dateを探す
  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end
end
