class AutoresController < ApplicationController
  def index
    @autores = Autor.all.order("created_at DESC")
  end

  def show
    @autor = Autor.find(params[:id])
  end

  def new
    @autor = Autor.new
  end

  def create
    @autor = Autor.new(autor_params)
    if @autor.save
      redirect_to @autor
    else
      render 'new'
    end
  end

  def edit
    @autor = Autor.find(params[:id])
  end

  def update
    @autor = Autor.find(params[:id])
    if @autor.update(autor_params)
      flash[:notice] = "el autor fue modificado exitosamente"
      redirect_to @autor
    else
      render 'edit'
    end
  end

  def destroy
    @autor = Autor.find(params[:id])
    @autor.destroy
    redirect_to autores_path, :notice => "Autor eliminado correctamente"
  end

  private

  def autor_params
    params.require(:autor).permit(:name, :last_name, :age, :nationality)
  end

end
