# frozen_string_literal: true

class PageUrlConstrainer
  def matches?(request)
    name = request.path.delete("/")
    Page.find_by_name(name)
  end
end

Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  namespace :admin do
    root "dashboard#index"
    resources :pages, :alerts, :sliders, :collapsibles, :markers, :card_groups,
              :contact_emails, :exhibits, :testimonials, :collections
    resources :photo_albums do
      resource :photos, only: %i[new create]
    end
    resources :settings, only: %i[show edit update]
    resources :users, only: %i[index destroy update]
  end

  namespace :docs do
    root "home#index"
    get "alerts", to: "how_to_use#alerts"
    get "card_groups", to: "how_to_use#card_groups"
    get "collapsibles", to: "how_to_use#collapsibles"
    get "collections", to: "how_to_use#ollections"
    get "contacts", to: "how_to_use#contacts"
    get "exhibits", to: "how_to_use#exhibits"
    get "markers_maps", to: "how_to_use#markers_maps"
    get "pages", to: "how_to_use#pages"
    get "photo_albums", to: "how_to_use#photo_albums"
    get "settings", to: "how_to_use#settings"
    get "sliders", to: "how_to_use#sliders"
    get "testimonials", to: "how_to_use#testimonials"
    get "make_admin", to: "how_to_use#make_admin"
  end

  devise_for :users
  root "home#index"
  post "pages/create_message", as: "create_message"
  resources :photo_albums, only: :show
  resources :testimonials, only: %i[new create]
  constraints(PageUrlConstrainer.new) do
    get ":name" => "pages#show"
  end

  # Error Handling
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#change_request_error", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
