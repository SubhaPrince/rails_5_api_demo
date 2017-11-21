class RenameDesciptionToDescriptionInTopic < ActiveRecord::Migration[5.1]
  def change
  	rename_column :topics, :desciption, :description
  end
end
