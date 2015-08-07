class Site < ActiveRecord::Base
  has_many :components, dependent: :destroy
  belongs_to :user, dependent: :destroy
  ratyrate_rateable 'text', 'video', 'gallery'
end
