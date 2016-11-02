class MovementCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movement_category, only: [:edit, :update, :destroy]

  def edit; end

  def index
    @movement_categories = MovementCategory.where(user_id: current_user.id)
  end

  def new
    @movement_category = MovementCategory.new
  end

  def create
    @movement_category = MovementCategory.new(movement_category_params)

    if @movement_category.save
      redirect_to movement_categories_path, notice: t('movements-categories.create.success')
    else
      render :new
    end
  end

  def update
    if @movement_category.update(movement_category_params)
      redirect_to movement_categories_path, notice: t('movements-categories.update.success')
      render :index, status: :ok, location: @movement_category
    else
      render :edit
    end
  end

  def destroy
    @movement_category.destroy
    redirect_to movement_categories_url, notice: t('movements-categories.delete.success')
  end

  private


  def set_movement_category
    @movement_category = MovementCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movement_category_params
    params.require(:movement_category).permit(:name, :type, :user_id)
  end
end
