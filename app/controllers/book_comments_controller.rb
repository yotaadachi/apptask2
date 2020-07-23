class BookCommentsController < ApplicationController
	def create
	  @book = Book.find(params[:book_id])
	  comment = @book.book_comments.new(book_comment_params)
	  comment.user_id = current_user.id
	  comment.save
	  @comment = BookComment.new
	end

	def destroy
	  @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
	  @comment.destroy
	  @book = @comment.book
	end

	private
	def book_comment_params
	 params.require(:book_comment).permit(:comment)
	end
end
