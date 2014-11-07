require 'bundler/setup'
Bundler.setup

require 'station_master'

require 'pry'
require 'webmock/rspec'
include WebMock::API
require 'benchmark'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/elencoStazioni/0').
      to_return(status: 200, body: <<-JSON.squish, headers: {})
        [{"codReg":15,"tipoStazione":3,"dettZoomStaz":[],"pstaz":[],"mappaCitta":{"urlImagePinpoint":"","urlImageBaloon":""},"codiceStazione":"S11212","codStazione":"S11212","lat":40.787682,"lon":15.758093,"latMappaCitta":0.0,"lonMappaCitta":0.0,"localita":{"nomeLungo":"CASTEL LAGOPESOLE","nomeBreve":"Castel Lagopes.","label":"","id":"S11212"},"esterno":false,"offsetX":0,"offsetY":0,"nomeCitta":"A"},{"codReg":15,"tipoStazione":3,"dettZoomStaz":[],"pstaz":[],"mappaCitta":{"urlImagePinpoint":"","urlImageBaloon":""},"codiceStazione":"S11214","codStazione":"S11214","lat":40.714667,"lon":15.785619,"latMappaCitta":0.0,"lonMappaCitta":0.0,"localita":{"nomeLungo":"AVIGLIANO LUCANIA","nomeBreve":"Avigliano Luc.","label":"","id":"S11214"},"esterno":false,"offsetX":0,"offsetY":0,"nomeCitta":"A"}]
      JSON

    stub_request(:get, 'http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/elencoStazioni/1').
      to_return(status: 200, body: <<-JSON.squish, headers: {})
        [{"codReg":15,"tipoStazione":3,"dettZoomStaz":[],"pstaz":[],"mappaCitta":{"urlImagePinpoint":"","urlImageBaloon":""},"codiceStazione":"S11219","codStazione":"S11219","lat":41.062304,"lon":15.595094,"latMappaCitta":0.0,"lonMappaCitta":0.0,"localita":{"nomeLungo":"LEONESSA","nomeBreve":"Leonessa","label":"","id":"S11219"},"esterno":false,"offsetX":0,"offsetY":0,"nomeCitta":"A"}]
      JSON

    stub_request(:get, 'http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/elencoStazioni/2').
      to_return(status: 200, body: '[]', headers: {})

    ['S11212', 'S11214', 'S11219'].each do |station_id|
      region_id = 15

      stub_request(:get, "http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/regione/#{station_id}").
        to_return(status: 200, body: "#{region_id}", headers: {})

      body = case station_id
        when 'S11212' then '{"codReg":15,"tipoStazione":3,"dettZoomStaz":[],"pstaz":[],"mappaCitta":{"urlImagePinpoint":"","urlImageBaloon":""},"codiceStazione":"S11212","codStazione":"S11212","lat":40.787682,"lon":15.758093,"latMappaCitta":0.0,"lonMappaCitta":0.0,"localita":{"nomeLungo":"CASTEL LAGOPESOLE","nomeBreve":"Castel Lagopes.","label":"","id":"S11212"},"esterno":false,"offsetX":0,"offsetY":0,"nomeCitta":"A"}'
        when 'S11214' then '{"codReg":15,"tipoStazione":3,"dettZoomStaz":[],"pstaz":[],"mappaCitta":{"urlImagePinpoint":"","urlImageBaloon":""},"codiceStazione":"S11214","codStazione":"S11214","lat":40.714667,"lon":15.785619,"latMappaCitta":0.0,"lonMappaCitta":0.0,"localita":{"nomeLungo":"AVIGLIANO LUCANIA","nomeBreve":"Avigliano Luc.","label":"","id":"S11214"},"esterno":false,"offsetX":0,"offsetY":0,"nomeCitta":"A"}'
        when 'S11219' then '{"codReg":15,"tipoStazione":3,"dettZoomStaz":[],"pstaz":[],"mappaCitta":{"urlImagePinpoint":"","urlImageBaloon":""},"codiceStazione":"S11219","codStazione":"S11219","lat":41.062304,"lon":15.595094,"latMappaCitta":0.0,"lonMappaCitta":0.0,"localita":{"nomeLungo":"LEONESSA","nomeBreve":"Leonessa","label":"","id":"S11219"},"esterno":false,"offsetX":0,"offsetY":0,"nomeCitta":"A"}'
      end

      stub_request(:get, "http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/dettaglioStazione/#{station_id}/#{region_id}").
        to_return(status: 200, body: body, headers: {})
    end

    stub_request(:get, "http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/autocompletaStazione/Tor").
      to_return(status: 200, body: <<-JSON, headers: {})
        TORINO P.NUOVA|S00219
        TOR SAPIENZA|S08501
        TOR VERGATA|S08655
        TORA PRESENZANO|S09202
        TORANO LATTARICO|S11906
        TORCHIARA|S11706
        TORINO DORA|S00224
        TORINO LINGOTTO|S00452
        TORINO PORTA SUSA|S00035
        TORINO REBAUDENGO FOSSATA|S00060
        TORINO S. PAOLO|S00223
        TORINO STURA|S00228
        TORRALBA|S12865
        TORRAZZA P.|S00234
        TORRE ANNUNZIATA CENTRALE|S09806
        TORRE ANNUNZIATA CITTA'|S09805
        TORRE DEI PASSERI|S07706
        TORRE DEL GRECO|S09803
        TORRE DEL LAGO PUCCINI|S06015
        TORRE DE` PICENARDI|S01918
        TORRE IN PIETRA-PALIDORO|S08019
        TORRE MELISSA|S11821
        TORRE ORSAIA|S11717
        TORRE PELLICE|S00524
        TORRE S.GIORGIO|S00545
        TORREBERETTI|S00039
        TORREMEZZO DI FALCONARA|S11971
        TORRENIERI|S06817
        TORRICELLA|S07011
        TORRICOLA|S08600
        TORRILE S. POLO|S01853
        TORRITA DI SIENA|S06854
        TORTONA|S01810
        TORTORETO LIDO|S07801
        TORVISCOSA|S03206
      JSON
  end
end