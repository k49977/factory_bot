require "test_helper"

class UserTest < ActiveSupport::TestCase
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end
