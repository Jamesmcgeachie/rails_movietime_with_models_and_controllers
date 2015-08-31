class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(sanitized_movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update 
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(sanitized_movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

private

# This is NOT what a sanitized movie params should be, but this was just so I could get it working for now. 
  def sanitized_movie_params
    params.require(:movie).permit(:title, :director, :release_year, :rating)
  end

end
