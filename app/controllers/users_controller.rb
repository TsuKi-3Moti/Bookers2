class UsersController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(@book.id)
  end

  def index
    @users = User.all
    @user = current_user 
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books #特定のユーザ（@user）に関連付けられた投稿全て（books）を取得し@booksに格納
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end

end
