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
require 'rails_helper'

RSpec.describe Therapy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
