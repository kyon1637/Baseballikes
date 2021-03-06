# frozen_string_literal: true

class CreateBaseballs < ActiveRecord::Migration[5.2]
  def change
    create_table :baseballs do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :baseball_image_id

      t.timestamps
    end
  end
end
