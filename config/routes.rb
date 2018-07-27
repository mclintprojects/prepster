Rails.application.routes.draw do
    post "auth/login"
    post "auth/signup"

    post "quiz", to: "quiz#new"
end
