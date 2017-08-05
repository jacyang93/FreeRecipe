class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploaders :pictures, RecipePictureUploader

  def self.search(search)
    if search
      where("title ILIKE ?", "%#{search}%")
    end
  end
end
