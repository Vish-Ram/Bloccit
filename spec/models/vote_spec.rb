require 'rails_helper'

describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(Vote.new(value: 1).value).to eq(1 || -1) 
      end
    end
  end
end