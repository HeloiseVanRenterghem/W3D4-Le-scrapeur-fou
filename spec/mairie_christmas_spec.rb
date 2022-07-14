require_relative '../lib/mairie_christmas_bis'

describe "the mairie_christmas method" do
  it "should return an array" do
    expect(mairie_christmas).to eq(Array)
  end

  it "should return an array of hashes" do
    expect(mairie_christmas[0].class).to eq(Hash)
    expect(mairie_christmas[2].class).to eq(Hash)
    expect(mairie_christmas[10].class).to eq(Hash)
  end

  it "should have the correct number of cities" do
    expect(mairie_christmas.length).to be = 185
  end

  it "should return correct values" do
    expect(mairie_christmas).to eq("AVERNES"=>"mairie.avernes@orange.fr")
    #expect(mairie_christmas).to include("FROUVILLE"=>"mairie-frouville95@wanadoo.fr")
    #expect(mairie_christmas).to include("COMMENY"=>"mairiecommeny@wanadoo.fr")
  end

end