class CreateProductLevel < ActiveRecord::Migration
  def up

    fields = {
	:product_level_id => :integer,
	:product_subcategory => :string,
	:product_category => :string,
	:product_type => :string
    }	    

    create_table :product_levels do |t|
	fields.each do |name, type|
		t.column name, type
	end
    end
    fields.each do |name, type|
      add_index :product_levels, name unless type == :text
    end


    add_column :product_dimension, :description, :string
    add_column :product_dimension, :price, :decimal, :precision => 10, :scale => 2, :default => 0
    add_column :product_dimension, :product_level_id, :integer
    add_column :product_dimension, :custom, :integer

  end

  def down
    remove_column :product_dimension, :description
    remove_column :product_dimension, :price
    remove_column :product_dimension, :product_level_id
    remove_column :proudct_dimension, :custom
    drop_table :product_levels
  end
end
