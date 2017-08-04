class Recipe < ApplicationRecord
  belongs_to :user
  mount_uploaders :pictures, RecipePictureUploader
end
