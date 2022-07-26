Given(/^I am on snackmagic login page$/) do
    @snackmagic_loginpage = SnackMagicLoginPage.new(@browser.browser)
    @snackmagic_loginpage.visit_page
    @snackmagic_loginpage.click_login
end

When(/^I login to my account$/) do
   @snackmagic_loginpage.user_login
   sleep 10
end

Then(/^I am redirected to snackmagic homepage$/) do
    expect(@browser.title.start_with?('SnackMagic')).to eq(true)
end

Given(/^I am on snackmagic homepage$/) do
   @snackmagic_homepage = SnackMagicHomePage.new(@browser.browser)
   begin
     @snackmagic_homepage.click_done
   rescue
   end
end

When(/^I click on start order$/) do
   @snackmagic_homepage.click_start_order
   sleep 7
end

Then(/^I get redirected to snackmagic send treat page$/) do
    expect(@browser.current_url).to eq('https://automation-frontend.snackmagic.com/send-a-treat')
end

Given(/^I am on snackmagic send treat page$/) do
   @snackmagic_send_treat_page = SnackMagicSendTreatPage.new(@browser.browser)
end

When(/^I click start a new order$/) do
   @snackmagic_send_treat_page.start_order
end

Then(/^create a new treat$/) do
   @snackmagic_send_treat_page.fill_treat
   @snackmagic_send_treat_page.click_create_order
end

And(/^start customizing the modals$/) do
    @snackmagic_send_treat_page.build_their_own
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.click_dollar_45
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.click_restrict_to_email
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.fill_recipients
    sleep 1
    @snackmagic_send_treat_page.click_next
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.click_collect_address
    sleep 1
    @snackmagic_send_treat_page.click_save_and_cont
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.click_standard_shipping
    sleep 1
    @snackmagic_send_treat_page.click_save_and_cont
    @snackmagic_send_treat_page.send_msg
    sleep 1
    @snackmagic_send_treat_page.click_next
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.donot_brand
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.donot_add_video
    sleep 1
    @snackmagic_send_treat_page.click_save_and_cont
    @snackmagic_send_treat_page.donot_add_swag
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.click_snackmagic_box
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.donot_customize_box
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.donot_add_note
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.donot_add_donation
    sleep 1
    @snackmagic_send_treat_page.click_save_and_cont
    sleep 1
end

When(/^I proceed to checkout$/) do
    @snackmagic_send_treat_page.proceed_to_checkout
    @snackmagic_send_treat_page.click_saved_credit_card
    sleep 1
    @snackmagic_send_treat_page.click_next
    @snackmagic_send_treat_page.click_original_payment_method
    sleep 1
    @snackmagic_send_treat_page.click_next
end

And(/^send email to the recipient$/) do
    @snackmagic_send_treat_page.send_email
    sleep 1
    @snackmagic_send_treat_page.click_next
end

Then(/^order is placed successfully$/) do
    expect(@snackmagic_send_treat_page.success_msg_text).to eq('HOORAY!')
    sleep 3
end