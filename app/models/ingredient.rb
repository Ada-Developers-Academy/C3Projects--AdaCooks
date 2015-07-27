class Ingredient < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  has_and_belongs_to_many :recipes
  

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
