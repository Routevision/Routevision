Routevision::Application.routes.draw do
  scope '/api' do
    scope :module => :sf_transit do
      resources :stops, :controller => :stops, :path => '/stops' do
        resources :leg_stops, :controller => :leg_stops, :path => '/legs'
      end

      resources :legs, :path => '/legs' do
        resources :leg_stops, :controller => :leg_stops, :path => '/stops'
      end

      resources :routes, :controller => :routes, :path => '/routes' do
        resources :legs, :controller => :legs, :path => '/legs'
      end
    end
  end

  root :to => 'routes#testpage'
end
