class MoveBodyToActionText < ActiveRecord::Migration[7.0]
  def change
    Upload.all.find_each do |upload|
      upload.update(content: upload.comment)
    end

    remove_column :uploads, :comment
  end
end
