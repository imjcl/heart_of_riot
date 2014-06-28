module HeartOfRiot
  
  class Summoner
    attr_accessor :name, :id, :profile_icon, :revision_date, :level
    VERSION = 'v1.4'
    
    def initialize(attributes = {})
      attributes.each do |k, v|
        if self.respond_to? k
          send "#{k}=", v
        end
      end
    end

    def find_by_name
      uri = "#{VERSION}/summoner/by-name/#{@name}"
      response = HeartOfRiot::get('na', uri)
      assign_attr response, @name
    end

    def find_by_id
      uri = "#{VERSION}/summoner/#{@id}"
      response = HeartOfRiot::get('na', uri)
      assign_attr response, @id
    end

    def get_masteries
      uri = "#{VERSION}/summoner/#{@id}/masteries"
    end

    def map_name
      uri = "#{VERSION}/summoner/#{@id}/name"
      response = HeartOfRiot::get('na', uri)
      @name = response["#{@id}"]
    end
    
    def get_runes
      uri = "#{VERSION}/summoner/#{@id}/runes"
    end  

    def assign_attr attributes, field
      attributes[field].each do |k, v|
        case k
        when "profileIconId"
          @profile_icon = v
        when "summonerLevel"
          @level = v
        when "revisionDate"
          @revision_date = v
        else self.respond_to? k
          send "#{k}=", v
        end
      end      
    end      
  
  end

end

