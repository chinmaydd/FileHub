class Upload < ActiveRecord::Base

	scope :sorted, lambda { order("uploads.no_of_downloads DESC")}

	has_attached_file :doc
	validates_attachment_size :doc, :less_than => 10.megabytes
	do_not_validate_attachment_file_type :doc
	belongs_to :user

end
