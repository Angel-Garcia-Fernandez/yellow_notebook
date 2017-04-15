class AddPaperclipFileToXlsFiles < ActiveRecord::Migration
  def up
    add_attachment :xls_files, :file
  end

  def down
    remove_attachment :xls_files, :file
  end
end
