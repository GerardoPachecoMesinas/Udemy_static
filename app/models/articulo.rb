class Articulo < ApplicationRecord
  belongs_to :autor # esta asociación define la relación y dependencia con el módelo autor
  has_many :comments

  # la siguientes son validaciones que definen reglas para la cración de de cada articulo
  validates :titulo, presence: {:message => "no puede estar vacío"} #en el momento en en el que existe un mensaje nu es necesario utilizar true ya que esta implicito
  validates :contenido, presence: {:message => "no puede estar vacío"}, length: {minimum: 50, :message => "es demasiado corto, mínimo 50 caracteres"}
end
