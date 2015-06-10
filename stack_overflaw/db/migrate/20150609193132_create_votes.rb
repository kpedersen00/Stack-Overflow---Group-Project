class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :rating, polymorphic: true, index:true
      t.timestamps
    end
  end
end
