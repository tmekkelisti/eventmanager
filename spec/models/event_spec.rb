require 'rails_helper'

describe Event, type: :model do
  let(:event) { FactoryGirl.create(:event) }
  it "should have valid factory" do
    expect(event).to be_valid
  end
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
  it { should validate_presence_of(:location_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_length_of(:name).
    is_at_least(3).
    on(:create) }
  it { should validate_length_of(:description).
    is_at_most(500).
    on(:create) }
  it { should belong_to(:user) }
end
