class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :password
end
