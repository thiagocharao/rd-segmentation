json.extract! contact, :id, :name, :email, :age, :state, :role, :created_at, :updated_at
json.url contact_url(contact, format: :json)
