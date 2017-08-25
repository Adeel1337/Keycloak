# This script is a gem will talk to keycloak and get a access token back from Curl.

require 'httparty'

class Keycloak
  include HTTParty


  attr_accessor :client_id, :client_secret, :grant_type

  def initialize(client_id, client_secrtet, grant_type)
    @client_id = client_id
    @client_secret = client_secret
    @grant_type = grant_type
  end

  def tokens
    response = self.post("http://localhost:8080/auth/realms/adeel/protocol/openid-connect/token",
      query: { client_id: @client_id, client_secret: @client_secret, grant_type:  "client_credentials" })

  end

end




keycloak = Keycloak.new()

puts keycloak
