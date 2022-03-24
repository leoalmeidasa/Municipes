class CreateEnderecos < ActiveRecord::Migration[6.1]
  def change
    create_table :enderecos do |t|
      t.string :CEP
      t.string :street
      t.string :complement
      t.string :district
      t.string :city
      t.string :UF
      t.string :IBGE_code
      t.references :municipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
