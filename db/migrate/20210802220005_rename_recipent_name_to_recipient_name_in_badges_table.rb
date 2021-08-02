class RenameRecipentNameToRecipientNameInBadgesTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :badges, :recipent_name, :recipient_name
  end
end
