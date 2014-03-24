class Card < ActiveRecord::Base

  belongs_to :user
  has_many :connections
  has_many :tokens

    has_attached_file :background_image, :styles => {:cardsize => "150x262>"},
                    :storage => :s3,
                    :bucket => 'cardMe',
                    :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }
    has_attached_file :ogranization_logo, :styles => {:logo => "50x50>"},
                    :storage => :s3,
                    :bucket => 'cardMe',
                    :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }                    
    has_attached_file :profile_picture, :styles => {:thumb => "50x40>"},
                    :storage => :s3,
                    :bucket => 'cardMe',
                    :s3_credentials => {
                    :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }

  validates_attachment_content_type :profile_picture, :content_type => ['image/jpeg', 'image/png']
  validates_attachment_content_type :background_image, :content_type => ['image/jpeg', 'image/png']
  validates_attachment_content_type :ogranization_logo, :content_type => ['image/jpeg', 'image/png']

  validates_attachment_size :background_image, :less_than => 5.megabytes
  validates_attachment_size :ogranization_logo, :less_than => 5.megabytes
  validates_attachment_size :profile_picture, :less_than => 5.megabytes

end