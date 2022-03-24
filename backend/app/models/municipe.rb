class Municipe < ApplicationRecord
  has_one :endereco, inverse_of: :municipe
  accepts_nested_attributes_for :endereco
end
