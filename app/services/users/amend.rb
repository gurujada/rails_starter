module Users
  class Amend
    include Dry::Monads[:result]
    def call(params)
      user = User.update(params)

      if user.save
        Success(user)
      else
        Failure(user)
      end
    end
  end
end
