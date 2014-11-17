require 'spec_helper'

describe StationMaster::Schedule do
  let(:schedule) { StationMaster::Schedule }

  context "#find_station_arrivals" do
    it "returns arrivals given a station code and optionally a datetime" do
      expect(schedule).to respond_to(:find_station_arrivals)
      expect(schedule.find_station_arrivals('S00219', Time.new(2014,11,10,22,35,26,'+01:00')).map(&:to_hash)).to eq([
        {
          train_code: 24875,
          train_type: "REG",
          origin: "SUSA",
          platform: "14",
          time: "22:15",
          delay: 0
        },
        {
          train_code: 2530,
          train_type: "REG",
          origin: "GENOVA BRIGNOLE",
          platform: "7",
          time: "22:30",
          delay: 7
        },
        {
          train_code: 24832,
          train_type: "REG",
          origin: "IVREA",
          platform: "18",
          time: "22:32",
          delay: 0
        },
        {
          train_code: 10216,
          train_type: "REG",
          origin: "CUNEO",
          platform: "3",
          time: "22:35",
          delay: 0
        },
        {
          train_code: 9580,
          train_type: "ES*",
          origin: "ROMA TERMINI",
          platform: "17",
          time: "22:40",
          delay: 6
        },
        {
          train_code: 10029,
          train_type: "REG",
          origin: "BARDONECCHIA",
          platform: "15",
          time: "22:45",
          delay: 0
        },
        {
          train_code: 9746,
          train_type: "ES*",
          origin: "VENEZIA SANTA LUCIA",
          platform: "11",
          time: "22:50",
          delay: 17
        },
        {
          train_code: 2030,
          train_type: "REG",
          origin: "MILANO CENTRALE",
          platform: "13",
          time: "23:07",
          delay: 0
        },
        {
          train_code: 9654,
          train_type: "ES*",
          origin: "ROMA TERMINI",
          platform: "16",
          time: "23:12",
          delay: 8
        },
        {
          train_code: 24877,
          train_type: "REG",
          origin: "SUSA",
          platform: "4",
          time: "23:17",
          delay: 0
        },
        {
          train_code: 33800,
          train_type: "REG",
          origin: "SAVONA",
          platform: "",
          time: "23:35",
          delay: 0
        },
        {
          train_code: 2532,
          train_type: "REG",
          origin: "GENOVA BRIGNOLE",
          platform: "5",
          time: "23:40",
          delay: 0
        },
        {
          train_code: 10031,
          train_type: "REG",
          origin: "BARDONECCHIA",
          platform: "15",
          time: "23:45",
          delay: 0
        },
        {
          train_code: 2032,
          train_type: "REG",
          origin: "MILANO CENTRALE",
          platform: "13",
          time: "00:10",
          delay: 0
        }
      ])
    end
  end

  context "#find_station_departures" do
    it "returns departures given a station code and optionally a datetime" do
      expect(schedule).to respond_to(:find_station_departures)
      expect(schedule.find_station_departures('S00219', Time.new(2014,11,10,22,18,44,'+01:00')).map(&:to_hash)).to eq([
        {
          train_code: 10030,
          train_type: "REG",
          destination: "BARDONECCHIA",
          platform: "18",
          time: "22:20",
          delay: 0
        },
        {
          train_code: 23601,
          train_type: "REG",
          destination: "ALESSANDRIA",
          platform: "8",
          time: "22:20",
          delay: 0
        },
        {
          train_code: 24835,
          train_type: "REG",
          destination: "IVREA",
          platform: "15",
          time: "22:28",
          delay: 0
        },
        {
          train_code: 24876,
          train_type: "REG",
          destination: "BUSSOLENO",
          platform: "14",
          time: "22:45",
          delay: 0
        },
        {
          train_code: 2033,
          train_type: "REG",
          destination: "MILANO CENTRALE",
          platform: "13",
          time: "22:54",
          delay: 0
        },
        {
          train_code: 10221,
          train_type: "REG",
          destination: "CUNEO",
          platform: "3",
          time: "23:25",
          delay: 0
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
