class RenameHashToChainpointHashInBadgesTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :badges, :hash, :chainpoint_hash
  end
end
