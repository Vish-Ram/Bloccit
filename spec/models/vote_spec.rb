describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(Vote.new.value)to eq(-1) || expect(Vote.new.value) to eq(1)
      end
    end
  end
end