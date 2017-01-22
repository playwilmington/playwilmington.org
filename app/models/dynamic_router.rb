module DynamicRouter
  class << self
    def load
      return unless ActiveRecord::Base.connection.data_source_exists? 'pages'
      PlayWilmington::Application.routes.draw do
        Page.main.each do |pg|
          get "/#{pg.name}", to: 'pages#show',
                             defaults: { id: pg.id, name: pg.name }
        end
      end
    end

    def reload
      PlayWilmington::Application.routes_reloader.reload!
    end
  end
end
