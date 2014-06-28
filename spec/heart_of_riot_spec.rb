require 'spec_helper'

describe HeartOfRiot do  
  describe 'Summoner' do
    let(:summoner) { HeartOfRiot::Summoner.new(name: 'imjl') }

    it 'should have the name of the summoner now' do
      expect(summoner.name).to eq 'imjl'
    end

    describe 'should populate attributes' do
      before { summoner.find_by_name }

      it 'should have attributes' do
        expect(summoner.id).to eq 38645059
        expect(summoner.profile_icon).to eq 589
        expect(summoner.level).to eq 30
        expect(summoner.revision_date).to eq 1403955303000
      end
    end

    describe 'map name' do
      let(:mapping) { HeartOfRiot::Summoner.new(id: 38645059) }
      before { mapping.map_name }
      it 'should map an id to the name' do
        expect(mapping.name).to eq 'imjl'
      end
    end
  end
end