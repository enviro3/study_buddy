class FixColumnNames < ActiveRecord::Migration[5.1]
  def change
    change_table :flash_cards do |t|
      t.rename :title, :prompt
      t.rename :text, :answer
    end
  end
end
