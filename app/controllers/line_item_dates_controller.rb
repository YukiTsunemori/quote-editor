class LineItemDatesController < ApplicationController
  # 各アクションの実行前にset_quoteメソッドを実行
  before_action :set_quote
  def new
    # 現在のquoteに紐づく新しいline_item_dateオブジェクトをビルド
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    # パラメーターから受け取った値で新しいline_item_dateオブジェクトをビルド
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)

    if @line_item_date.save
      redirect_to quote_path(@quote), notice: "Date was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end
end
