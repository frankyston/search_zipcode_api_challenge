require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:zipcode) }
  it { is_expected.to validate_presence_of(:state) }
  it { is_expected.to validate_presence_of(:city) }
end
