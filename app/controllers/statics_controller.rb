class StaticsController < ApplicationController
  def contact
    @message = "hola desde el controller" # estas variables de entorno podran ser utulizadas en la accion contact y acceder a sus valores desde views
    @users = ["juan", "paco", "pedro", "de la mar"] # mediante ruby embebido

  end

  def about_us   # es recomendable separar entre presentación y funcionalidad por este motivo estamos obteniendo los valores del link hacia "about_us"
    @id = params[:id] # desde en este sitio el controlador(funcionalidad) con el método params y guardandolos en variables de entorno para que desde 
    @page = params[:pagina] # las views(presentacion), podamos acceder a su valor y utilizarlo a conveniencia.
  end

  def privacy # para agrgar nuevas vistas el primer paso sería agregar el método(accion), posteriormente crear el archivo del mismo nombre en views
  end # y por ultimo crear la ruta modificando el archivo routes

end
