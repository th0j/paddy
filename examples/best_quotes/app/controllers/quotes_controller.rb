class QuotesController < Paddy::Controller
  def a_quote
    render :a_quote, noun: :winking
  end

  def quote_1
    # quote_a = Paddy::Model::FileModel.find(1)
    quote_a = FileModel.find(1)
    render :quote, obj: quote_a
  end
end


