class Products < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:country_of_origin, :string)
      t.column(:cost, :integer)

      t.timestamps()
    end
  end
end
