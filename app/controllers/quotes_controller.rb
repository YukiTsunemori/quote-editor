class QuotesController < ApplicationController
  before_action :set_quote, only: [ :show, :edit, :update, :destroy ]

  def index
    @quotes = current_company.quotes.ordered
    # orderedスコープを使用して、Quoteモデルから取得したレコードをIDの降順にソートする。
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_company.quotes.build(quote_params)
    if @quote.save
      respond_to do |format|
        # binding.irb
        format.html { redirect_to quotes_path} #, notice: "Quote was successfully created." } # formがdata: { turbo: false }の時要求される
        # binding.irb
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." } # formがdata: { turbo: true }の時要求される
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "削除しました" }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private
    def set_quote
      @quote = current_company.quotes.find(params[:id])
      # セキュリティ上の理由から、Quoteの代わりにcurrent_company.quotesを使用する必要がある
    end

    def quote_params
      params.require(:quote).permit(:name)
      # binding.irb
    end
end
