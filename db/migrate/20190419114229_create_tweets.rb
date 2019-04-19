class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :time
      t.integer :winflag
      t.integer :loseflag, default: 0
      t.bigint :since_id

      t.timestamps
    end
  end
end
