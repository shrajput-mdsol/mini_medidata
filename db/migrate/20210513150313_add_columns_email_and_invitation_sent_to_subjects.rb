class AddColumnsEmailAndInvitationSentToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :email, :string
    add_column :subjects, :invitation_flag, :boolean, :default => false
  end
end
