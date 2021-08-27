class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

 def create
   # １. データを新規登録するためのインスタンス作成
   @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
        redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
 end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book)
    else
      # @book = Book.find(params[:id])
      render action: :edit
  end
end

  def destroy
    flash[:notice] = "Book was successfully destroyed"
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
