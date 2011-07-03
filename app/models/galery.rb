class Galery < ActiveRecord::Base
  belongs_to :user
  has_one :galery_file, :as => :assetable, :dependent => :destroy

  accepts_nested_attributes_for :galery_file, :allow_destroy => true
end