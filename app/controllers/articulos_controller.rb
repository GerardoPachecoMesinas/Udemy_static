class ArticulosController < ApplicationController
  before_action :set_articulo, only: %i[ show edit update destroy ] #esa linea de código sustituye el find necesario en los métodos declarados en los corchetes
                                                                    # dicho método queda definido como private en la parte de abajo
  def index
    @articulos = Articulo.all.order("created_at DESC") # .order()modifica la query sql para mostrar los articulos
  end     # en forma decendente, de esta manera siempre mostrará hasta arriba los articulos mas recientes

  def show
  end 

  def new
    @articulo = Articulo.new
  end

  def create
    @articulo = Articulo.new(articulo_params) #aqui estamos llamando creando un nuevo artículo con los atributos del metodo articulo_params 
    if @articulo.save
      redirect_to @articulo
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @articulo.update(articulo_params)
      flash[:notice] = "Artículo modificado correctamente"
      redirect_to @articulo
    else
      render 'edit'
    end
  end

  def destroy
    @articulo.destroy!

    respond_to do |format|
      format.html { redirect_to articulos_path, notice: "Artículo eliminado correctamente" }
      format.json { head :no_content }
    end
  end

private
  def set_articulo
    @articulo = Articulo.find(params[:id])
  end

  def articulo_params # aqui estamos definiendo que atributos contendrá el metodo articulo_params para la creacion de nuevas 
    params.require(:articulo).permit(:titulo, :contenido, :autor_id) # instancias de artículo y de esta forma poder tener parametros
  end # seguros.

end
