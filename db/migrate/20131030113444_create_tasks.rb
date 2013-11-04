class CreateTasks < ActiveRecord::Migration
  def up
  	create_table :Tasks do |t|
  		t.string :title
  		t.text :content
  	end 
  	
  end

  def down
  end
end
