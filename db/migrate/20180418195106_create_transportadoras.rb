class CreateTransportadoras < ActiveRecord::Migration[5.2]
  def change
    create_table :transportadoras do |t|
      t.string :nome

      t.timestamps
    end
  end
end
