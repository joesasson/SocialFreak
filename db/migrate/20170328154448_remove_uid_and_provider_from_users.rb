class RemoveUidAndProviderFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :uid, :string, null: false
    remove_column :users, :provider, :string, null: false
  end
end
