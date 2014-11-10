require 'spec_helper'

describe StationMaster::Schedule do
  let(:schedule) { StationMaster::Schedule }

  context "#find_arrivals" do
    it "returns arrivals given a station code and optionally a datetime" do
      expect(schedule).to respond_to(:find_arrivals)
      expect(schedule.find_arrivals('S00219', Time.new(2014,11,10,22,35,26,'+01:00')).map(&:to_hash)).to eq([
        {
          origin: "SUSA",
          platform: 14,
          time: "22:15",
          train_code: 24875,
          train_type: "REG"
        },
        {
          origin: "GENOVA BRIGNOLE",
          platform: 7,
          time: "22:30",
          train_code: 2530,
          train_type: "REG"
        },
        {
          origin: "IVREA",
          platform: 18,
          time: "22:32",
          train_code: 24832,
          train_type: "REG"
        },
        {
          origin: "CUNEO",
          platform: 3,
          time: "22:35",
          train_code: 10216,
          train_type: "REG"
        },
        {
          origin: "ROMA TERMINI",
          platform: 17,
          time: "22:40",
          train_code: 9580,
          train_type: "ES*"
        },
        {
          origin: "BARDONECCHIA",
          platform: 15,
          time: "22:45",
          train_code: 10029,
          train_type: "REG"
        },
        {
          origin: "VENEZIA SANTA LUCIA",
          platform: 11,
          time: "22:50",
          train_code: 9746,
          train_type: "ES*"
        },
        {
          origin: "MILANO CENTRALE",
          platform: 13,
          time: "23:07",
          train_code: 2030,
          train_type: "REG"
        },
        {
          origin: "ROMA TERMINI",
          platform: 16,
          time: "23:12",
          train_code: 9654,
          train_type: "ES*"
        },
        {
          origin: "SUSA",
          platform: 4,
          time: "23:17",
          train_code: 24877,
          train_type: "REG"
        },
        {
          origin: "SAVONA",
          platform: 0,
          time: "23:35",
          train_code: 33800,
          train_type: "REG"
        },
        {
          origin: "GENOVA BRIGNOLE",
          platform: 5,
          time: "23:40",
          train_code: 2532,
          train_type: "REG"
        },
        {
          origin: "BARDONECCHIA",
          platform: 15,
          time: "23:45",
          train_code: 10031,
          train_type: "REG"
        },
        {
          origin: "MILANO CENTRALE",
          platform: 13,
          time: "00:10",
          train_code: 2032,
          train_type: "REG"
        }
      ])
    end
  end

  context "#find_departures" do
    it "returns departures given a station code and optionally a datetime" do
      expect(schedule).to respond_to(:find_departures)
      expect(schedule.find_departures('S00219', Time.new(2014,11,10,22,18,44,'+01:00')).map(&:to_hash)).to eq([
        {
          train_code: 10030,
          train_type: "REG",
          destination: "BARDONECCHIA",
          platform: 18,
          time: "22:20"
        },
        {
          train_code: 23601,
          train_type: "REG",
          destination: "ALESSANDRIA",
          platform: 8,
          time: "22:20"
        },
        {
          train_code: 24835,
          train_type: "REG",
          destination: "IVREA",
          platform: 15,
          time: "22:28"
        },
        {
          train_code: 24876,
          train_type: "REG",
          destination: "BUSSOLENO",
          platform: 14,
          time: "22:45"
        },
        {
          train_code: 2033,
          train_type: "REG",
          destination: "MILANO CENTRALE",
          platform: 13,
          time: "22:54"
        },
        {
          train_code: 10221,
          train_type: "REG",
          destination: "CUNEO",
          platform: 3,
          time: "23:25"
        }
      ])
    end
  end

  context "#format_time" do
    it "returns time formatted" do
      expect(schedule.send(:format_time, Time.new(2014,11,10,11,27,57,'+01:00'))).to eq("Mon Nov 10 2014 11:27:57 GMT+0100 (CET)")
    end
  end
end
