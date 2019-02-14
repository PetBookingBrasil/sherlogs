class Authenticator
  ALGORITHM = 'HS256'

  def initialize(payload)
    @payload = payload
  end

  def encode
    JWT.encode(@payload, ENV['JWS_SECRET_TOKEN'], ALGORITHM)
  end

  def decode
    JWT.decode(@payload, ENV['JWS_SECRET_TOKEN'], ALGORITHM)
  end
end
