require 'spec_helper'

describe HeartOfRiot do
  HeartOfRiot::API_KEY = ''
  describe 'Summoner' do
    let(:summoner) { HeartOfRiot::Summoner.new(name: 'imjl') }

    it 'should have the name of the summoner now' do
      expect(summoner.name).to eq 'imjl'
    end

    describe 'should populate attributes' do
      before { summoner.find_by_name }

      # some attributes are non-static, so they should at least be digits
      it 'should have attributes' do
        expect(summoner.id).to eq 38645059
        expect(summoner.profile_icon.to_s).to match /\d+/
        expect(summoner.level.to_s).to match /\d+/
        expect(summoner.revision_date.to_s).to match /\d+/
      end
    end

    describe 'map name' do
      let(:mapping) { HeartOfRiot::Summoner.new(id: 38645059) }
      before { mapping.map_name }
      it 'should map an id to the name' do
        expect(mapping.name).to match /.+/i
      end
    end
  end
end
