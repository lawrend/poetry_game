class AddFieldsToLines < ActiveRecord::Migration
  def change
    add_column :lines, :poem_id, :integer 
    add_column :lines, :line_number, :integer
    add_column :lines, :syllable_count, :integer
    add_column :lines, :line_content, :text 	
  end
end
