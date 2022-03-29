class Municipe < ApplicationRecord

  has_one :endereco
  accepts_nested_attributes_for :endereco

  mount_uploader :photo, MunicipePhotoUploader

  def update_photo_file_objects
    if photo_file.present?
      self.photo_file_content_type = photo_file.content_type
      self.photo_file_file_size = photo_file.file.size
    end
  end
end
