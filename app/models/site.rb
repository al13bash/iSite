class Site < ActiveRecord::Base
  has_many :components, dependent: :destroy
  belongs_to :user
  ratyrate_rateable 'text', 'video', 'gallery'
  
  searchable do
    text :components do
      components.map { |component| component.data}
    end
    text :user do
      user.username
    end
  end
end
