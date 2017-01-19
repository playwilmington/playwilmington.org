class DynamicRouter
  def self.load
    PlayWilmington::Application.routes.draw do
      Page.main.each do |pg|
        get "/#{pg.name}", to: 'pages#show',
                           defaults: { id: pg.id, name: pg.name }
      end
    end
  end

  def self.reload
    PlayWilmington::Application.routes_reloader.reload!
  end
end
