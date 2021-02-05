require 'jwt'
module AuthToken
  def AuthToken.issue_token(payload)
    payload['exp'] = 24.hours.from_now.to_i # set 1 day
    JWT.encode(payload, 'my$ecretK3y')
  end

  def AuthToken.valid?(token)
    begin
      JWT.decode(token, 'my$ecretK3y')
    rescue
      false
    end
  end
end
