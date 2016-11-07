require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { FactoryGirl.create(:location) }
  it "should have valid factory" do
    expect(location).to be_valid
  end
  it { should validate_presence_of(:address) }
  it { should validate_length_of(:name).
    is_at_least(3).
    on(:create) }

end
