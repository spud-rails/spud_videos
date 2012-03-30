Rails.application.routes.draw do
	if Spud::Videos.enable_videos_route
		resources :videos,:only => [:index]
	end
	namespace :spud do
		namespace :admin do
			resources :videos do
				get 'reorder', :on => :collection
			end
		end
	end
end
