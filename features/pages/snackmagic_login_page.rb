class SnackMagicLoginPage
    include PageObject
    include DataMagic

    page_url('https://admin:admin@automation-frontend.snackmagic.com/')
    button(:login, :xpath => '//*[@id="root"]/div/div[2]/div/div/div/div/div[3]/header/div[2]/div[3]/div[2]/button')
    text_field(:email, :xpath => '//*[@id="form-login"]/div[1]/input')
    text_field(:password, :xpath => '//*[@id="password-login"]')
    button(:login_user, :xpath => '//*[@id="form-login"]/div[3]/div/button')    

    def visit_page
        goto
    end

    def click_login
        login
    end

    def user_login
        populate_page_with data_for :user1
        login_user
    end
end