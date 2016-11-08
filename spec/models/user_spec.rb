require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  it "should have a valid factory" do
    expect(user).to be_valid
  end

  describe "Username uniqueness" do
    subject { FactoryGirl.build(:user) }
    it { should validate_uniqueness_of(:username).
      case_insensitive }
  end

  it { should validate_length_of(:password).
    is_at_least(6).
    on(:create) }

  it { should have_many(:events) }

  describe "Password and password confirmation mismatch" do
    let(:u) { FactoryGirl.build(:user, password_confirmation: "mismatch") }
    it { expect(u).not_to be_valid }
  end

end
