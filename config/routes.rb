Rails.application.routes.draw do
	resources :videos,:only => [:index]
	namespace :spud do
		namespace :admin do
			resources :videos do
				get 'reorder', :on => :member
			end
		end
	end
end
