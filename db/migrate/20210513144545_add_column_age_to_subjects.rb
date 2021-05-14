class AddColumnAgeToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :age, :integer, :default => false
  end
end
