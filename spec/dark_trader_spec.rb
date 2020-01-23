require_relative '../lib/dark-trader'


describe "perform" do
    it "should test that perform is working" do
expect(perform).not_to be_nil
end 
end

describe "array_size" do
    it "should test the size of the array" do
      expect(perform.size).to eq(200)
    end 
end


#Nous pouvons vérifier la taille de l'array, et la comparer au nombre de cryptomonnaies sur le site
