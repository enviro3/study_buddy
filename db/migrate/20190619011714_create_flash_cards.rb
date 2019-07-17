class CreateFlashCards < ActiveRecord::Migration[5.1]
  def change
    create_table :flash_cards do |t|
      t.string :prompt
      t.text :answer

      t.timestamps
    end
  end
end
