class Book < ApplicationRecord
	# belongs_to :category
 mount_uploader :image, ImageUploader

	def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    all
   end
end

end
