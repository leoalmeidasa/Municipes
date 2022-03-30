class EnderecoSerializer < ActiveModel::Serializer
  attributes :CEP, :street, :complement, :district, :city, :UF, :IBGE_code

end
