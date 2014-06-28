require "json"
require "rest_client"

require "heart_of_riot/version"
require "heart_of_riot/summoner"
require "heart_of_riot/game"

module HeartOfRiot
  def self.get(region, resource, options = {})
    region.downcase!
    response = RestClient.get "https://#{region}.api.pvp.net/api/lol/#{region}/#{resource}?api_key=#{HeartOfRiot::API_KEY}"
    if response.code == 200
      JSON.parse(response.body)
    end
  end
end
