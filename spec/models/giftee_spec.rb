require 'rails_helper'

RSpec.describe Giftee, type: :model do


  describe ".valdiations" do
    it "validates presence of name" do
      expect(Giftee.new).to_not be_valid
      expect(Giftee.new(name: "Ada")).to be_valid
    end
  end
end
