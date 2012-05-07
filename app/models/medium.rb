class Medium < ActiveRecord::Base
	belongs_to :album
	mount_uploader :attachment, AttachmentUploader
end
