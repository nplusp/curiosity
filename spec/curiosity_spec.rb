require 'spec_helper'

describe Curiosity do
  let(:curiosity) { Curiosity.new }

  context "initial state" do
    it "has initial status" do
      expect(curiosity.status).to eql :waiting
    end
  end
end
