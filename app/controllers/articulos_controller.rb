class ArticulosController < ApplicationController
  def index
    @articulos = Articulo.all.order("created_at DESC") # .order()modifica la query sql para mostrar los articulos
  end     # en forma decendente, de esta manera siempre mostrará hasta arriba los articulos mas recientes

  def show
    @articulo = Articulo.find(params[:id]) # de esta forma recojemos el parametro id de la url para ingresarlo como 
  end # parametro en de find y apuntar a el respectivo artículo

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
    @articulo = Articulo.find(params[:id])
  end

  def update
    @articulo = Articulo.find(params[:id])
    if @articulo.update(articulo_params)
      flash[:notice] = "Artículo modificado correctamente"
      redirect_to @articulo
    else
      render 'edit'
    end
  end

  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy
    redirect_to articulos_path, :notice => "Artículo eliminado correctamente"
  end

  private

  def articulo_params # aqui estamos definiendo que atributos contendrá el metodo articulo_params para la creacion de nuevas 
    params.require(:articulo).permit(:titulo, :contenido, :autor_id) # instancias de artículo y de esta forma poder tener parametros
  end # seguros.

end
