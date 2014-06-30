module HeartOfRiot
  module Game
   VERSION = 'v1.3'

   def self.get_recent region, summoner
     uri = "#{VERSION}/game/by-summoner/#{summoner}/recent"
     response = HeartOfRiot::get(region, uri)
     games = response['games']
   end
  end
end
