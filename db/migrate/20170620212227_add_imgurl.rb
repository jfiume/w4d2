class AddImgurl < ActiveRecord::Migration[5.0]
  def change
    add_column :cats, :img_url, :string
  end
end
