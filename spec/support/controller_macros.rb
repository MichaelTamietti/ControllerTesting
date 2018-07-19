module ControllerMacros
    def login_user
        before(:each) do
            @request.env['devise.mapping'] = Devise.mappings[:user]
            @user = User.create(email: 'test@test.com', password: 'password', first_name: 'Test', last_name: 'Testerington', age: 31, gender: 'Male')
            sign_in @user
        end
    end
end 