class BooksController < ApplicationController

  def top
    @books = Book.all
  end

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
   @book = Book.find(params[:id])
  end
  
  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
     flash[:notice] = "Book was successfully created."
    else
    @books = Book.all
    render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(book_params)
    flash[:notice] = "Book was successfully update."
    redirect_to book_path(@book.id)
   else
    render "show"
   end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
    end
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  end

end