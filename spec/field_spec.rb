require 'spec_helper'

describe Field do
  describe "when creating field" do
    context "it does" do
      it "creates with default size" do
        field = Field.new
        expect(field.x).to eql 5
        expect(field.y).to eql 5
      end

      it "creates with custom size" do
        field = Field.new(x: 10, y: 10)
        expect(field.x).to eql 10
        expect(field.y).to eql 10
      end
    end

    context "it doesn't" do
      it "creates with invalid size" do
        expect { Field.new(x: "Invalid", y: "Input") }.to raise_error(ArgumentError)
      end

      it "creates with negative size" do
        expect { Field.new(x: -10, y: -10) }.to raise_error(ArgumentError, "Field sizes should greater than zero")
      end
    end
  end

  describe "when adding rover" do
    let(:field) { Field.new }

    context "it does" do
      let(:curiosity) { Curiosity.new }

      it "add a valid rover" do
        field.add_rover(curiosity)
        expect(field.rovers).to include curiosity
      end
    end

    context "it doesn't" do
      it "add an invalid rover" do
        expect { field.add_rover(Curiosity.new(x: 10, y: 10)) }.to raise_error(ArgumentError, "Invalid rover position")
      end
    end
  end
end
