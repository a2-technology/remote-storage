class AddUserReferenceToUploads < ActiveRecord::Migration[7.0]
  def change
    change_table :uploads do |t|
      t.references :user, null:false, foreign_key: true
    end

    add_index :uploads, :user_id
  end
end
