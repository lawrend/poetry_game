class AddUserRefToPoems < ActiveRecord::Migration
  def change
    add_reference :poems, :user, index: true, foreign_key: true
  end
end
