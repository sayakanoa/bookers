class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "successfully"
    else
      @books = Book.all
      render :index
    end
  end

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
   @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice: "successfully"
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path(@book), notice: "successfully"
    else
    render action: :destroy
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
