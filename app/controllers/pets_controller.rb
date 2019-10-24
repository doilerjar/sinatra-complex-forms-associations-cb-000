class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(name: params[:pet_name])

    if !params[:owner_name].empty?
      @owner = Owner.create(name: params[:owner_name])
      @owner.pets << @pet
      @owner.save
    else
      @owner = Owner.find(params[:owner_id])
      @owner.pets << @pet
      @owner.save
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end