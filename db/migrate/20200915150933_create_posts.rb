class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :description

      t.timestamps
    end
  end
end
