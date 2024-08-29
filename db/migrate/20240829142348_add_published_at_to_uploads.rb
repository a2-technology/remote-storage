class AddPublishedAtToUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :published_at, :datetime
  end
end
