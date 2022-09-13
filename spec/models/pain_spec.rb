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
require 'rails_helper'

RSpec.describe Pain, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
