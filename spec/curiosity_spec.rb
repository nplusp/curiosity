require 'spec_helper'

describe Curiosity do
  describe "when adding rover" do
    context "it does" do
      it "creates with default position and facing" do
        curiosity = Curiosity.new
        expect(curiosity.x).to eql 1
        expect(curiosity.y).to eql 1
        expect(curiosity.facing).to eql 'N'
      end

      it "creates with custom position and facing" do
        curiosity = Curiosity.new(x: 2, y: 3, facing: 'W')
        expect(curiosity.x).to eql 2
        expect(curiosity.y).to eql 3
        expect(curiosity.facing).to eql 'W'
      end
    end

    context "it doesn't" do
      it "creates with invalid position" do
        expect { Curiosity.new(x: "Invalid", y: "Input") }.to raise_error(ArgumentError)
      end

      it "creates with invalid facing" do
        expect { Curiosity.new(facing: "invalid") }.to raise_error(ArgumentError, "Invalid facing")
      end
    end
  end
end
