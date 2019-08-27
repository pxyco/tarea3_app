class PostSearch 
  attr_reader :date_from, :date_to, :text
  
  def initialize(params)
    params ||= {}
    @date_from = parse_date(params[:date_from], 1.month.ago.to_date.to_s)
    @date_to = parse_date(params[:date_to], Date.today.to_date.to_s)
    @text = params[:text]
  end
  
  def scope(id)
    search = Post.all
    search = search.where('user_id = ?', id)
    search = search.where('created_at BETWEEN ? AND ?', @date_from, @date_to)
    search = search.where('text LIKE ?', "%#{@text}%")
    
  end
  
  private
    def parse_date (date_string, default)
      Date.parse(date_string)
    rescue ArgumentError, TypeError
      default 
    end
  
end