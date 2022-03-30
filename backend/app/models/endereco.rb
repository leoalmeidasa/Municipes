class Endereco < ApplicationRecord
  belongs_to :municipe, inverse_of: :endereco

  validates :CEP, :street, :district, :city, :UF, presence: true
  validates :CEP, length: { is: 8 }
end
