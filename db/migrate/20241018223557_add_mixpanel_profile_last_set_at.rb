class AddMixpanelProfileLastSetAt < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :mixpanel_profile_last_set_at, :datetime, null: true
  end
end
