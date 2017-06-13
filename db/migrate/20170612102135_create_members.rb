class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references  :user,  index: true, foreign_key: true, null: false
      t.references  :group,  index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
