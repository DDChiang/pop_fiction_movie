class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create]
  before_action :is_author, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:destroy]
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  # GET /movies/1/edit
  def edit
    @genres = Genre.all
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      @genres = Genre.all
      @genres.each do |g|
       if (params[g.name] != nil)
         @movie.genres << g
       end
      end
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @genres = Genre.all
    respond_to do |format|
      if @movie.update(movie_params)
        @movie.genres.destroy_all
        @genres.each do |g|
          if (params[g.name] != nil)
            @movie.genres.push(Genre.where('name' => g.name))
          end
        end
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end
    def is_author
      if !(current_user?(@movie.user))
        redirect_to movies_path, notice: "Not your movie!"
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :preview, :full_script, :poster)
    end
end
