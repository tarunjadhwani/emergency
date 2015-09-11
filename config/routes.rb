Rails.application.routes.draw do
  root 'static#index'

  get 'next-doctor' => 'static#doctorNextStep'
  get 'next-hospital' => 'static#hospitalNextStep'
  get 'fill-address' => 'static#doctorAddress'

  devise_for :users
  namespace :admin do
    resources :requests
    resources :doctors
    resources :ambulances
    resources :nurses, controller: 'doctors'
    resources :cpr_experts, controller: 'doctors'
    resources :resident_doctors, controller: 'doctors'
    resources :er_doctors, controller: 'doctors'
    resources :symptoms
    resources :diseases
    resources :precautions
    resources :hospitals
  end
end
