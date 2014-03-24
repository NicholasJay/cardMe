Cardme::Application.routes.draw do
  root "welcome#index"

  resources :users do
    resources :cards, shallow: true 
    resources :groups
  end

  post "/users/:id", to: "users#send_mail"
  post "/users/:id/sms", to: "users#send_sms"

  get "/invite", to: "invites#show"

  post "/invitesession", to: "session#newsession" 

  get "/connections", to: "connections#index"
  post "/connections", to: "connections#create"

  post "/groupsconnections", to: "groups_connections#create"
  delete "/groupsconnections", to: "groups_connections#destroy"
  get "/groupsconnections", to: "groups_connections#index"

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/logout", to: "session#destroy"

  get "/card_dashboard/:id", to: "cards#card_dashboard"
end
