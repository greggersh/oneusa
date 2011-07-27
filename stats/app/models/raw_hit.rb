# A string from 1.usa.gov representing a click event
class RawHit
  # Actual string value
  @val = ""
  @json_val = nil
  
  def initialize(json_string=nil)
    @val = json_string
    @json_val = ActiveSupport::JSON.decode(json_string)
  end
  
  # Determines if the User Agent is from a mobile device and optionally adds to a mobile or non-mobile list
  def is_mobile?(mobile_agents=nil, non_mobile_agents=nil)
    json = @json_val
    # Return nil on processing error
    return json unless json
    
    user_agent = json["a"]
    mobile = ((user_agent =~ /Android|iPhone|Phone|iPad|mobile/) ? true : false)
    
    if mobile
      mobile_agents << user_agent if mobile_agents
    else
      non_mobile_agents << user_agent if non_mobile_agents
    end
    mobile
  end
  
  # Determines the agency of the Government URL - currently the domain
  def agency
    json = @json_val
    # Return nil on processing error
    return json unless json
    
    # Deterine hostname
    hostname = (json["u"].split("//")[1] || json["u"]).split("/").first
    
    # Return Domain (without suffix)
    hostname.split(".")[-2]
  end
  
  # Convert json string from 1.usa.gov to a Hit
  def to_hit
    json = @json_val
    
    # Return nil on processing error
    return nil unless json
    
    Hit.new(:clicked_at => Time.at(json["t"]), :page => json["u"], :is_mobile => is_mobile?, :agency => agency)
  end
  
  # Access a json field property
  def [](field)
    @json_val && @json_val[field]
  end
end
