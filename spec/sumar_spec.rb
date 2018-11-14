require "./lib/sumar"
describe Sumar do

    before(:each) do
        @sumar = Sumar.new
    end
      
    it "Deberia generar 4 cuando sumo 2+2" do
		expect(@sumar.sumarr(2,2)).to eq 4
    end
    
    it "Deberia generar 10 cuando sumo 7+3" do
		expect(@sumar.sumarr(7,3)).to eq 10
    end

    it "Deberia generar 100 cuando sumo 53+47" do
		expect(@sumar.sumarr(53,47)).to eq 100
    end

end
