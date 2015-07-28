require "carrierwave/orm/activerecord" # TODO: figure out how image uploader works

class Recipe < ActiveRecord::Base # OPTIMIZE: the image uploader
  # Associations
  belongs_to :user
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks

  # Validations
  validates :name, presence: true
  validates :steps, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Scopes
  scope :alphabetized, -> { order(:name) }

  # mount_uploader :avatar, AvatarUploader # FIXME: we didn't do this right?
  
  # uploader = AvatarUploader.new
  # uploader.store!(my_file)
  # uploader.retrieve_from_store!('my_file.png')
  # u = User.new
  # FIRST WAY TO GET FILE
  # u.avatar = params[:file]
  # SECOND WAY TO GET FILE
  # File.open('somewhere') do |f|
  #   u.avatar = |f|
  # end
  # NOW YOU HAVE FILE, SO SAVE
  # u.save!
  # u.avatar.url # => '/url/to/file.png'
  # u.avatar.current_path # 'path/to/file.png'
  # u.avatar_indentifier # 'file.png'
end
