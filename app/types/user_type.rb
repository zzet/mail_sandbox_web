class UserType < User
  include ApplicationType

  permit :email, :password
end
