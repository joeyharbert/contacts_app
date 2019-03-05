require 'http'

response = HTTP.get("http://localhost:3000/api/contacts")

p response.parse