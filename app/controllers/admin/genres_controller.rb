class Admin::GenresController < ApplicationController

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "Genre was successfully created."
      redirect_to admin_genres_path
    end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
  end

  def update
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
