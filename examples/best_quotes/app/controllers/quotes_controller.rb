class QuotesController < Paddy::Controller
  def index
    quotes = FileModel.all
    render index, quotes: quotes
  end

  def a_quote
    render :a_quote, noun: :winking
  end

  def quote_1
    # quote_a = Paddy::Model::FileModel.find(1)
    quote_a = FileModel.find(1)
    render :quote, obj: quote_a
  end

  def new_quote
    attrs = {
      submitter: 'web_user',
      quote: 'A picture is worth a thousand pixels',
      attribution: 'Me'
    }

    m = FileModel.create attrs
    render :quote, obj: m
  end
end


