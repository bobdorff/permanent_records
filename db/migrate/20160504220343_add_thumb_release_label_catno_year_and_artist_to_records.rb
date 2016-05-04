class AddThumbReleaseLabelCatnoYearAndArtistToRecords < ActiveRecord::Migration
  def change
    add_column :records, :thumb, :string
    add_column :records, :release, :string
    add_column :records, :label, :string
    add_column :records, :catno, :string
    add_column :records, :year, :string
  end
end
