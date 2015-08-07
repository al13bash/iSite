class Component < ActiveRecord::Base
  belongs_to :site#, dependent: :destroy
end
