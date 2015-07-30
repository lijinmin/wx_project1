class CreatePayQrcodeServices < ActiveRecord::Migration
  def change
    create_table :pay_qrcode_services do |t|
      t.string :website

      t.timestamps null: false
    end
  end
end
