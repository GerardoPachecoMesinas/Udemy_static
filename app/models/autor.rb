class Autor < ApplicationRecord
  has_many :articulos, dependent: :destroy
end
