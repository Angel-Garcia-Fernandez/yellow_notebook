class XlsFile < ActiveRecord::Base
  #Relations
  has_many :parses
  has_attached_file :file, #validate_media_type: false ,
                    :path => ':rails_root/public/system/:attachment/:id/:filename' #, path:  #, default_url: '/excel_files/:id' #,skip_spoof_detection: true

  #Validations
  validates_attachment :file, presence: true, content_type: {
                                    content_type: /\A.*\/.*\z/ }

  # validates_attachment_content_type :file,
  #                                   content_type: '%w application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  # application/vnd.msexcel application/vnd.x-dos_ms_excel application/vnd.x-excel application/vnd.x-ms-excel
  # application/vnd.x-msexcel application/vnd.x-xls application/vnd.csv application/vnd.excel text/anytext
  # text/comma-separated-values text/plain'
  #           content_type: /\A.*\/.*\z/
            # content_type: /\A(application\/vnd\.(ms-excel|openxmlformats-officedocument\.spreadsheetml\.sheet|msexcel|x-dos_ms_excel|x-excel|x-ms-excel|x-msexcel|x-xls|csv|excel)|text\/(anytext|comma-separated-values))\z/
  # do_not_validate_attachment_file_type :file

  #Public_Methods
  def to_s
    file_file_name.to_s
  end

  def file_content
    Paperclip.io_adapters.for( file ).read
  end
end
