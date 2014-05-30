class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, :styles => { :large => "500x500>", :medium => "300x300>"}, :validates_attachment_content_type => :image, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage/

end
