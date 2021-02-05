class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :zipcode
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :street

      t.timestamps
    end
  end
end
