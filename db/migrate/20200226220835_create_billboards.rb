class CreateBillboards < ActiveRecord::Migration[6.0]
  def change
    create_table :billboards do |t|
      t.string :name
      t.string :region
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
