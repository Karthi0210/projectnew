class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :authorname
      t.string :email
      t.timestamps 
    end
  end
end
