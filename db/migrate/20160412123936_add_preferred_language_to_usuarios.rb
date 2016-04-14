class AddPreferredLanguageToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :preferred_language, :string
  end
end
