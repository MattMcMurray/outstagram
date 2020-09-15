class CreateFollowRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_relationships do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.boolean :active

      t.timestamps
    end
  end
end
