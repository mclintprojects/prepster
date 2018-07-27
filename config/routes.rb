Rails.application.routes.draw do
    post "auth/login"
    post "auth/signup"

    get "quiz", to: "quiz#get"
    post "quiz", to: "quiz#new"
    delete "quiz", to: "quiz#delete"
    get "quiz/search"
    get "quiz/finalize"

    post "question", to: "question#new"
    put "question", to: "question#update"
    delete "question", to: "question#delete"

end
