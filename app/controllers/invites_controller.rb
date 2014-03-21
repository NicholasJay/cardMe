class InvitesController < ApplicationController

  def show
    token_url = request.original_url
    token_key = token_url.split("")
    equal_sign_index = token_key.index("=") + 1
    token_key = token_key.join("")
    token_key = token_key[equal_sign_index, token_key.length-1]
    @token = Token.find_by(secret_key: token_key)
    @card = Card.find_by(id: @token.card_id)
  end

end
