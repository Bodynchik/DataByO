class BookCommentsController < InheritedResources::Base
  private

  def book_comment_params
    params.require(:book_comment).permit(:book_id, :client_id, :comment_text)
  end
end
