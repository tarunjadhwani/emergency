Rails.application.routes.draw do
  devise_for :users
  root 'static#index'

  get 'next-doctor' => 'static#doctorNextStep'
  get 'next-hospital' => 'static#hospitalNextStep'
  get 'fill-address' => 'static#doctorAddress'
  get 'patient-condition' => 'static#patientCondition'
  get 'doctor' => 'requests#doctorMap'
  get 'doctor-selected' => 'requests#doctorSelected'
  get 'doctor-listing' => 'requests#doctorListing'
  get 'doctor-request' => 'requests#doctorRequest'
  get 'allocate_doctor' => 'requests#allocate_doctor'

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

  get 'requests/hospital', to: 'requests#new_hospital', as: :request_hospital
  get 'requests/ambulance', to: 'requests#new_ambulance', as: :request_ambulance
  get 'requests/doctor', to: 'requests#new', as: :request_doctor
  get 'requests/:id/address', to: 'requests#new_address', as: :new_address
  get 'requests/:id/symptoms', to: 'requests#new_symptom', as: :new_symptom
  resources :requests, only: [:new, :create, :update] do
  end
end
