Routevision::Application.routes.draw do
  scope '/api' do
    scope :module => :sf_transit do
      resources :vehicles
      
      resources :stops, :controller => :stops, :path => '/stops' do
        resources :leg_stops, :controller => :leg_stops, :path => '/legs'
      end

      resources :legs, :path => '/legs' do
        resources :leg_stops, :controller => :leg_stops, :path => '/stops'
        resources :vehicles
      end

      resources :routes, :controller => :routes, :path => '/routes' do
        resources :legs, :controller => :legs, :path => '/legs'
        resources :vehicles
      end
    end
    resources :service_reports
  end

  resources :vehicles do
    resources :service_reports
  end

  resources :service_reports, :only => :index
  match :stevens_playground, :to => 'routes#testpage'
  match '/vehicles/:vehicle_id/service_reports', :controller => :service_reports
  root :controller => :service_reports, :action => :new, :as => '/service_reports'
end
