class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = set_user
    @posts = Post.where(user_id: @user.id)
    @address = Address.find_by_user_id(@user.id)
    if @user.nil?
      flash[:alert]="User not found"
      redirect_to users_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path(@user.id), notice: "User created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = set_user
  end

  def update
    @user = set_user
    if @user.update(user_params)
      redirect_to users_path(@user.id), notice: "User updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
      @user = set_user
      @user.destroy
      redirect_to users_path, notice: "User deleted successfully"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :title, :password, :phone)
    end

  private
    def set_user
      @user = User.find_by_id(params[:id])
    end
end
