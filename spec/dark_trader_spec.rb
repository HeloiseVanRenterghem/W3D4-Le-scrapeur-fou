require_relative '../lib/dark_trader_bis'

describe "the dark_trader method" do
  it "should return an array" do
    expect(dark_trader.class).to eq(Array)
  end

  it "should return an array of hashes" do
    expect(dark_trader[0].class).to eq(Hash)
    expect(dark_trader[2].class).to eq(Hash)
    expect(dark_trader[10].class).to eq(Hash)
  end

  it "should have many cryptos" do
    expect(dark_trader.length).to be >= 20
  end

  it "should return correct values" do
    expect(dark_trader).to include("BTC"=>20512.52)
    expect(dark_trader).to include("LTC"=>50.99)
    expect(dark_trader).to include("TRX"=>0.06683)
  end

end