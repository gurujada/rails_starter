module Users
  class Add
    include Dry::Monads[:result]
    def call(params)
      user = User.new(params)

      if user.save
        Success(user)
      else
        Failure(user)
      end
    end
  end
end
