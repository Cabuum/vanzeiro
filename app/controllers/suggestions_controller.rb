class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def index
    @suggestions = Suggestion.all
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      redirect_to root_path, notice: t('suggestions.create.success')
    else
      render :new
    end
  end

  def update
    if @suggestion.update(suggestion_params)
      redirect_to root_path, notice: t('suggestions.update.success')
    else
      render :edit
    end
  end

  private

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:description, :title, :email)
  end
end
