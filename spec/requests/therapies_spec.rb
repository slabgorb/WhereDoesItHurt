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

RSpec.describe "Therapies", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end
end
