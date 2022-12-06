class CreatePdfs < ActiveRecord::Migration[7.0]
  def change
    create_table :pdfs do |t|
      t.string :title
      t.string :page_count
      t.string :filename
      t.string :process_time

      t.timestamps
    end
  end
end
