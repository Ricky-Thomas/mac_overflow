class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
  end

  def edit
    if @user.recipe == nil
      @recipe_name = "Your Recipe Name"
      @ingredients_str =  "Your ingredients"
      @instructions_str = "Your instructions"
    else
      @recipe_name = @user.recipe.name
      @ingredients_str =  @user.recipe.ingredients_str
      @instructions_str = @user.recipe.instructions_str
    end
  end

  def show
  end

  def update
    recipe = Recipe.create(name: params['recipe_name'])
    recipe.parse_ingredients!(params[:ingredients])
    recipe.parse_instructions!(params[:instructions])
    if @user.update(user_params)
      @user.recipe = recipe
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      redirect_to root_path
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :pic_url, :password, :password_confirmation)
  end

end
