class Municipe < ApplicationRecord

  has_one :endereco
  accepts_nested_attributes_for :endereco

  validates :description, :birth_date, :telephone, presence: true
  validates :cpf, presence: true, length: { minimum: 11, maximum: 11 }, uniqueness: true
  validates :cns, presence: true, length: { minimum: 15, maximum: 15 }, uniqueness: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :telephone, length: { is: 11 }

  validate :validate_birth_date

  mount_uploader :photo, MunicipePhotoUploader

  def update_photo_file_objects
    if photo_file.present?
      self.photo_file_content_type = photo_file.content_type
      self.photo_file_file_size = photo_file.file.size
    end
  end

  private

  def validate_birth_date
    if birth_date.present? && birth_date >= Date.current
      errors.add(:birth_date, 'inválida, favor preencha com uma data válida !')
    end
  end
end
