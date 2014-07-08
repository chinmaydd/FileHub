class Upload < ActiveRecord::Base

	has_secure_password

	scope :sorted, lambda { order("uploads.no_of_downloads DESC")}

	has_attached_file :doc
	validates_attachment_size :doc, :less_than => 10.megabytes

	belongs_to :user

	scope :sorted, lambda { order("uploads.position ASC")}
end
