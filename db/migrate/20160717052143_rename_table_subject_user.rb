class RenameTableSubjectUser < ActiveRecord::Migration
 def change
    rename_table :subjects_users, :users_subjects
  end
end
