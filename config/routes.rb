Rails.application.routes.draw do
  root 'static#index'

  get 'next-doctor' => 'static#doctorNextStep'
  get 'next-hospital' => 'static#hospitalNextStep'

  devise_for :users
  namespace :admin do
    resources :requests
    resources :doctors
    resources :ambulances
  end

  resources :nurses, controller: 'admin/doctors'
  resources :cpr_experts, controller: 'admin/doctors'
  resources :resident_doctors, controller: 'admin/doctors'
  resources :er_doctors, controller: 'admin/doctors'
end
