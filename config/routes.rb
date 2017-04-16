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
              :contact_emails, :exhibits, :testimonials
    resources :photo_albums do
      resource :photos, only: %i[new create]
    end
    resources :settings, only: %i[show edit update]
    resources :users, only: %i[index destroy update]
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
