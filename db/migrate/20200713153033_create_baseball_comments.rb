# frozen_string_literal: true

class CreateBaseballComments < ActiveRecord::Migration[5.2]
  def change
    create_table :baseball_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :baseball_id

      t.timestamps
    end
  end
end
