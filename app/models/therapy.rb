# == Schema Information
#
# Table name: therapies
#
#  id         :bigint           not null, primary key
#  action     :integer
#  efficacy   :integer
#  duration   :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Therapy < ApplicationRecord
end
