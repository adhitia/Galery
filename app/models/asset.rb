# == Schema Information
#
# Table name: assets
#
#  id             :integer(4)      not null, primary key
#  size           :integer(4)
#  content_type   :string(255)
#  filename       :string(255)
#  assetable_id   :integer(4)
#  assetable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  parent_id      :integer(4)
#  thumbnail      :string(255)
#  height         :integer(4)
#  width          :integer(4)
#  stat_file      :string(255)
#

class Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true
end
