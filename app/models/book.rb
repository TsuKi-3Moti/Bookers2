class Book < ApplicationRecord
  has_one_attached :image

  def new
    @book = Book.new
  end

  def create
    @book = Book.find(params[:id])
    @book.save
    redirect_to books_path
  end

  def index
  end

  def show
  end

end
