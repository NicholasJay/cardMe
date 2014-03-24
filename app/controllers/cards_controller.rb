class CardsController < ApplicationController
  before_action(:load_user, {only: [:create, :new, :edit, :update, :user] })
  before_action(:load_card, {only: [:edit, :update, :destroy, :show] })
  
  def index
    @group = Group.new
    @user = current_user
    @groups = current_user.groups
    @connections = @user.connections
    @cards = @user.cards.all
    @all_cards = Card.all
  end

  def edit
    
  end

  def show
    render json: @card
  end

  def update
    @card.update(card_params)
    redirect_to user_path(@user)
  end


  def new
    @card = @user.cards.new
  end

  def create
    @card = @user.cards.create(card_params)
    redirect_to user_path(@user)
  end

  def destroy
    @card.destroy
    redirect_to user_path(@card.user_id)
  end

  def card_params
    params.require(:card).permit(:email, :card_name, :position, :organization, :phone_number, :user_id, :background_image, :ogranization_logo, :profile_picture)
  end

  def card_dashboard
    @user = current_user
    @connections = @user.connections
    @connection = @connections.find_by(card_id: params[:card_id])
    @connection_card = Card.find_by(id: @connection.card_id)
    @nytarticles = news_stories(@connection_card.organization)
    @company_summary = company_summary(@connection_card.organization)
    render json: [news: @nytarticles, company_summary: @company_summary]
  end

  def news_stories(organization)
    org = organization
    org.downcase!
    org = org.gsub(/[\&\'\,']/, "")
    org = org.gsub("  "," ")
    org = org.gsub(" ","_")
    allarticles = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?#{org}&api-key=39DF8DDBDD4E589D9DB4A757AEC977E0:11:68994445&begin_date=20130101")
    articles = allarticles["response"]["docs"].map { |article| {"Title" => "#{article["snippet"]}", "Url" => "#{article["web_url"]}" }}
  end

  def company_summary(organization)
    org = organization
    org.downcase!
    org = org.gsub(/[\&\'\,']/, "")
    org = org.gsub("  "," ")
    org = org.gsub(" ","_")
    response = HTTParty.get("https://www.googleapis.com/freebase/v1/topic/en/#{org}?filter=/common/topic/article&key=AIzaSyCDr3U_5O8wWfSslYbrMgf59aGiZbXjuPY")
    summary = response["property"]["/common/topic/article"]["values"][0]["property"]["/common/document/text"]["values"][0]["value"]
  end

  def company_logo(organization)

  end

private

  def load_user
    return @user = current_user
  end 

  def load_card
    return @card = Card.find(params[:id])
  end

end
