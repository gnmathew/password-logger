class CredentialSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :email, :password, :account, :user_id
end
