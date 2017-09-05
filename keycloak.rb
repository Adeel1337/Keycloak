# This script is a gem will talk to keycloak and get a access token back from Curl.

require 'httparty'

class Keycloak
  include HTTParty


  attr_accessor :client_id, :client_secret

  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def tokens
	  self.class.post("http://localhost:8080/auth/realms/adeel/protocol/openid-connect/token",
      body: { client_id: @client_id, client_secret: @client_secret, grant_type:  "client_credentials" })

  end

end




keycloak = Keycloak.new("test","48ed04cd-0013-4bf4-bae2-50fb7ab8128d")

puts keycloak.tokens.inspect



#refactor to get access token as a string strip out everything else.
#
#key value of access token, hash parsed_response
#
#and expires in 
