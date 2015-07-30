get '/' do
	redirect '/parties'
end

get '/parties' do
  if params[:order]
  	@parties = Party.order(date_time: params[:order].to_s )
  else
  	@parties = Party.all
  end
  erb :index
end

get '/parties/new' do
	erb :create
end

# method to search for a party name and retrieve its results
get "/search" do 
	#@party = Party.where name: params[:name]
	if params[:name] && params[:name] != ""
		@parties = Party.where("name LIKE ?", "%#{params[:name]}%")
		erb :index
	else
		redirect "/error"
	end
end

# method to save a new party, the /new route should point here
post '/parties' do
  Party.create(
  	name: params[:name],
  	adress: params[:address],
  	coordinates: "#{params[:latitude]}/#{params[:longitude]}",
  	date_time: DateTime.strptime(params[:date],'%Y-%m-%dT%H:%M')
  )
  redirect '/'
end

# show individual post
get '/parties/:id' do
  @party = Party.find(params[:id])
  erb :view
end

# method to update an existing party, the /:id/edit should point here
post '/parties/:id/update' do
	party = Party.find(params[:id])
	party.update(
		name: params[:name],
  		adress: params[:address],
  		coordinates: "#{params[:latitude]}/#{params[:longitude]}",
  		date_time: params[:date]
  	)
  	redirect "/"
end


# form to edit a single party
get '/parties/:id/edit' do
	@party = Party.find(params[:id])
	@latitude, @longitude = @party.coordinates.split("/")
	erb :edit
end

#method to remove a single party
get '/parties/:id/remove' do
  Party.find(params[:id]).destroy		
  redirect '/'
end

post '/parties/:id/attendee' do
  attendee = Attendee.create(name: params[:name], email: params[:email], party_id: params[:id])
  redirect "/parties/#{attendee.party_id}"
end

get '/parties/:id/export' do
	# parties = ""
	# Party.all.each do |party|
	# 	parties << party.to_s
	# end
	# File.write('Parties',parties)

	# f = File.open('Parties','w')
	# Party.all.each do |party|
	# 	f << party.to_s
	# end
	# f.close

	# File.open('Parties', 'w') do |file| 
	# 	Party.all.each do |party|
	# 		file.write(party.to_s) 
	# 	end
	# end

	party = Party.find(params[:id])
	File.open("Party_#{params[:id]}_attendees", 'w') do |file| 
		file.write("name,email\n")
		party.attendees.each do |attendee|
			file.write("#{attendee.name},#{attendee.email}\n") 
		end
	end
	redirect '/'
end

get '/parties/attendee/:id/remove' do
  attendee = Attendee.find(params[:id]).destroy
  redirect "/parties/#{attendee.party_id}"
end



