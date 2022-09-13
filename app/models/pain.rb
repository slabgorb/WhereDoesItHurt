# == Schema Information
#
# Table name: pains
#
#  id          :bigint           not null, primary key
#  level       :integer
#  location    :jsonb
#  sensation   :integer
#  internality :integer
#  comments    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Pain < ApplicationRecord
end
