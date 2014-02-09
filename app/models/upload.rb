class Upload < ActiveRecord::Base
  belongs_to :workobject
  belongs_to :staff
  attr_accessible :filename, :size, :workobject_id, :state, :staff, :task_id
#  has_attached_file :upload

  def save_upload(file,wo,staff_id)
    logger.debug "+++ #{file.inspect}\n"
    logger.debug "--- #{staff_id}\n"
    logger.debug "=== #{wo["task_id"].inspect}\n"
    name =  file.original_filename
    directory = "uploads/#{wo['workobject_id']}"
    directory = "uploads_task/#{wo['task_id']}" unless wo["task_id"].nil?
   # create the file path
    Dir.mkdir(directory) unless FileTest.directory?(directory)
    logger.debug "+++ #{name}\n"
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(file.read) }
    write_attribute(:filename, name)
    write_attribute(:workobject_id, wo["workobject_id"])
    write_attribute(:task_id, wo["task_id"])
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
