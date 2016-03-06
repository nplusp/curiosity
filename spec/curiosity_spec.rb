require 'spec_helper'

describe Curiosity do
  describe "adding curiosity" do
    context "valid behavior" do
      it "has default position and facing" do
        curiosity = Curiosity.new
        expect(curiosity.x).to eql 1
        expect(curiosity.y).to eql 1
        expect(curiosity.facing).to eql 'N'
      end

      it "has custom position and facing" do
        curiosity = Curiosity.new(x: 2, y: 2, facing: 'S')
        expect(curiosity.x).to eql 2
        expect(curiosity.y).to eql 2
        expect(curiosity.facing).to eql 'S'
      end
    end

    context "invalid" do
      it "is invalid position" do
        expect { Curiosity.new(x: "Some", y: "Strange") }.to raise_error(ArgumentError)
      end

      it "is invalid facing" do
        expect { Curiosity.new(facing: "invalid") }.to raise_error(ArgumentError, "Invalid facing")
      end
    end
  end
end
