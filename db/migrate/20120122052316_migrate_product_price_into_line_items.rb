class MigrateProductPriceIntoLineItems < ActiveRecord::Migration
  def up
    say_with_time "Migrating price of product into line_item" do
      LineItem.find(:all).each do |lineitem|
      p lineitem
        lineitem.update_attribute :price, lineitem.product.price
      end
    end
  end

  def down
    say_with_time "demigrating price in line_item " do 
      LineItem.find(:all).each do |lineitem|
        lineitem.update_attribute :price, nil
      end
    end
  end
end
