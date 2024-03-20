Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
    origins "https://diy-dynamics-client-rmj8dp2i4-amandas-projects-ee19c902.vercel.app", "http://localhost:4200"
   
   resource "*",
    headers: :any,
    methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
   end
   