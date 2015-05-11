class MoviesController < ApplicationController
  before_action :ensure_logged_in
  def index
    @movies = Movie.all
  end

  def show
    @options = current_user.purchase_options
    @movie = Movie.includes(:purchase_options).find(params[:id])
  end
end
