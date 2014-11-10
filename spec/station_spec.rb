require 'spec_helper'

describe StationMaster::Station do
  let(:station) { StationMaster::Station }

  context "#all" do
    let(:all_stations) { StationMaster::Station.all }

    it "returns all stations" do
      expect(station).to respond_to(:all)
      expect(all_stations).to be_a(Array)
      expect(all_stations).not_to be_empty
      expect(all_stations.count).to eq(3)
      expect(all_stations.map(&:to_hash)).to eq([
        {
          station_code: "S11212",
          latitude: 40.787682,
          longitude: 15.758093,
          region_id: "15",
          location: "Castel Lagopesole"
        },
        {
          station_code: "S11214",
          latitude: 40.714667,
          longitude: 15.785619,
          region_id: "15",
          location: "Avigliano Lucania"
        },
        {
          station_code: "S11219",
          latitude: 41.062304,
          longitude: 15.595094,
          region_id: "15",
          location: "Leonessa"
        }])
    end
  end

  context "#find_by_city" do
    let(:found_stations) { StationMaster::Station.find_by_city('Tor') }

    it "returns stations that match with city name" do
      expect(station).to respond_to(:find_by_city)
      expect(found_stations).to be_a(Hash)
      expect(found_stations).not_to be_empty
      expect(found_stations.values.count).to eq(35)
      expect(found_stations).to eq(
        {
          :"TORINO P.NUOVA" => "S00219",
          :"TOR SAPIENZA" => "S08501",
          :"TOR VERGATA" => "S08655",
          :"TORA PRESENZANO" => "S09202",
          :"TORANO LATTARICO" => "S11906",
          :"TORCHIARA" => "S11706",
          :"TORINO DORA" => "S00224",
          :"TORINO LINGOTTO" => "S00452",
          :"TORINO PORTA SUSA" => "S00035",
          :"TORINO REBAUDENGO FOSSATA" => "S00060",
          :"TORINO S. PAOLO" => "S00223",
          :"TORINO STURA" => "S00228",
          :"TORRALBA" => "S12865",
          :"TORRAZZA P." => "S00234",
          :"TORRE ANNUNZIATA CENTRALE" => "S09806",
          :"TORRE ANNUNZIATA CITTA'" => "S09805",
          :"TORRE DEI PASSERI" => "S07706",
          :"TORRE DEL GRECO" => "S09803",
          :"TORRE DEL LAGO PUCCINI" => "S06015",
          :"TORRE DE` PICENARDI" => "S01918",
          :"TORRE IN PIETRA-PALIDORO" => "S08019",
          :"TORRE MELISSA" => "S11821",
          :"TORRE ORSAIA" => "S11717",
          :"TORRE PELLICE" => "S00524",
          :"TORRE S.GIORGIO" => "S00545",
          :"TORREBERETTI" => "S00039",
          :"TORREMEZZO DI FALCONARA" => "S11971",
          :"TORRENIERI" => "S06817",
          :"TORRICELLA" => "S07011",
          :"TORRICOLA" => "S08600",
          :"TORRILE S. POLO" => "S01853",
          :"TORRITA DI SIENA" => "S06854",
          :"TORTONA" => "S01810",
          :"TORTORETO LIDO" => "S07801",
          :"TORVISCOSA" => "S03206"
        }
      )
    end
  end
end
