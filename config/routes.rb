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
    resources :pages, :alerts, :sliders, :collapsibles
  end

  devise_for :users
  root "home#index"
  constraints(PageUrlConstrainer.new) do
    get ":name" => "pages#show"
  end

  # Error Handling
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#change_request_error", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
