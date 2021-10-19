class UserUtil
    attr_accessor
    def initialize(base_url, api_key)
        @base_url = base_url
        @api_key = api_key
    end
    
    def getUsers(offset:0, limit:10)
        @query="/users?offset=#{offset}&limit=#{limit}"
        puts "#{@query} the dddddd results from the worker"
        raise TypeError, 'offset must be an integer' unless offset.kind_of?(Integer)
        raise TypeError, 'limit must be an integer' unless limit.kind_of?(Integer)
        @response = RestClient::Request.new(
            :method => :get,
            :url => "#{@base_url}/#{@query}",
            :headers => { :accept => :json, :content_type => :json, :Authorization => @api_key }
        ).execute
    
        return results = JSON.parse(@response.to_str)
    end
end
