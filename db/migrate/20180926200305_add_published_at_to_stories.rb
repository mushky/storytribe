class AddPublishedAtToStories < ActiveRecord::Migration[5.2]
  def change
		add_column :stories, :published_at, :datetime  	
  end
end
