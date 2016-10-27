# frozen_string_literal: true
class NewslettersController < ApplicationController
  def index
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
    else
      render nothing: true
    end
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:mail, :skills, :discounts)
  end
end
