class EnderecoSerializer < ActiveModel::Serializer
  attributes :id, :CEP, :street, :complement, :district, :city, :UF, :IBGE_code

end
