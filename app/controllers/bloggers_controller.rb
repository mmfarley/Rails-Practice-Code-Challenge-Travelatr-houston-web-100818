class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all
  end

  def new
  end

  def create
    @blogger = Blogger.create(blogger_params(:name, :bio, :age))
    if @blogger.valid?
      redirect_to @blogger
    else
      render json: { "message": @blogger.errors.messages }
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params(*args)
    params.require(:blogger).permit(*args)
  end

end
