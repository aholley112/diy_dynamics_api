Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
    origins "https://diy-dynamics-client.vercel.app", "http://localhost:4200"
   
   resource "*",
    headers: :any,
    methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
   end
   