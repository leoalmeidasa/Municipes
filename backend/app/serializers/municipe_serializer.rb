class MunicipeSerializer < ActiveModel::Serializer
  attributes :id, :description, :cpf, :cns, :email, :birth_date, :telephone, :status, :photo

  has_one :endereco
end
