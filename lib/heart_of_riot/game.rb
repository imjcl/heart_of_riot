module HeartOfRiot
  class Game
   VERSION = 'v1.3'
   attr_accessor :games, :region, :summoner
   def initialize region, summoner
    @region = region
    @summoner = summoner
    get_games
   end

   def get_games
     uri = "#{VERSION}/game/by-summoner/#{@summoner}/recent"
     response = HeartOfRiot::get(@region, uri)
     @games = response['games']
   end
  end
end
