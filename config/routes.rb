Rails.application.routes.draw do
  devise_for :users
  root 'static#index'

  get 'next-doctor' => 'static#doctorNextStep'
  get 'next-hospital' => 'static#hospitalNextStep'
  get 'fill-address' => 'static#doctorAddress'
  get 'patient-condition' => 'static#patientCondition'
  get '/symptom_options', to: 'static#symptom_options'
  get '/doctor', to: 'static#doctorMap'
  get '/doctor-selected', to: 'static#doctorSelected'


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
    resources :services
    resources :specialities
  end
end
