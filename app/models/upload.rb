class Upload < ActiveRecord::Base
  belongs_to :workobject
  belongs_to :staff
  attr_accessible :filename, :size, :workobject_id, :state, :staff
#  has_attached_file :upload

  def rrr_upload(file,wo,staff_id)
    logger.debug "+++ #{file.inspect}\n"
    logger.debug "--- #{staff_id}\n"
#    logger.debug "=== #{task["task_id"].inspect}\n"
    name =  file.original_filename
    directory = "uploads/" + wo["workobject_id"]
   # create the file path
    Dir.mkdir(directory) unless FileTest.directory?(directory)
    logger.debug "+++ #{name}\n"
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(file.read) }
    write_attribute(:filename, name)
    write_attribute(:workobject_id, wo["workobject_id"])
    write_attribute(:size, File.size(path))
    write_attribute(:state, "new")
    write_attribute(:staff, @staff_id)
    save
  end

  def to_jq_upload
    {
      "name" => read_attribute(:filename),
      "size" => read_attribute(:size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
