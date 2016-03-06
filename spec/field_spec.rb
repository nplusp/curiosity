require 'spec_helper'

describe Field do
  let(:field) { Field.new }
  let(:custom_field) { Field.new(x: 10, y: 10) }

  context "initial state" do
    it "has initial size" do
      expect(field.x).to eql 5
      expect(field.y).to eql 5
    end

    it "has cutsom size" do
      expect(custom_field.x).to eql 10
      expect(custom_field.y).to eql 10
    end
  end
end
