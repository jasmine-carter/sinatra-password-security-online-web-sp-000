require "./config/environment"
require "./app/models/user"
class ApplicationController < Sinatra::Base

	configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
	end

	get "/" do
		erb :index
	end

	get "/signup" do
		erb :signup
	end

	post "/signup" do
<<<<<<< HEAD
		user = User.new(:username => params[:username], :password => params[:password])
=======
		#your code here!
		user = User.new(:username => params[:username], :password => params[:password])

>>>>>>> e0baa480f2410be061984ba47c267b9feaa9ddfe
		if user.save
			redirect '/login'
		else
			redirect 'failure'
		end
	end

	get "/login" do
		erb :login
	end

	post "/login" do
<<<<<<< HEAD
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/success"
		else
			redirect "failure"
		end
	end
=======
		#binding.pry
		user = User.find_by(:username => params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/success"
  else
    redirect "/failure"
  end
end
>>>>>>> e0baa480f2410be061984ba47c267b9feaa9ddfe

	get "/success" do
		if logged_in?
			erb :success
		else
			redirect "/login"
		end
	end

	get "/failure" do
		erb :failure
	end

	get "/logout" do
		session.clear
		redirect "/"
	end

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
	
end
