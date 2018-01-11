class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :desc
      t.decimal :price, precision: 18, scale: 2, default: BigDecimal("0")
      t.string :photo

      t.timestamps
    end
  end
end
