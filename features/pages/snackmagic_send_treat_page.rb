class SnackMagicSendTreatPage
    include PageObject
    include DataMagic

    link(:start_new_order, :xpath => '//*[@id="root"]/div/div[2]/div/div/div/div/div[2]/div/div/div/div[2]/div/a')
    text_field(:treat_name, :xpath => '//*[@id="treatName"]')
    text_field(:from, :xpath => '//*[@id="senderName"]')
    div(:team, :xpath => '//*[@id="send-a-treat"]/div[2]/div[2]/div[1]/div/label/div')
    div(:clients, :xpath => '//*[@id="send-a-treat"]/div[2]/div[2]/div[2]/div/label/div')
    div(:virtual_event, :xpath => '//*[@id="send-a-treat"]/div[2]/div[2]/div[3]/div/label/div')
    div(:friends_family, :xpath => '//*[@id="send-a-treat"]/div[2]/div[2]/div[4]/div/label/div')
    div(:other, :xpath => '//*[@id="send-a-treat"]/div[2]/div[2]/div[5]/div/label/div')
    text_field(:enter_other, :xpath => '//*[@id="otherTreatDescription"]')
    div(:snacks, :xpath => '//*[@id="send-a-treat"]/div[3]/div[2]/div[1]/div/label/div[1]/div[1]')
    div(:swag, :xpath => '//*[@id="send-a-treat"]/div[3]/div[2]/div[2]/div/label/div[1]/div[1]')
    div(:snacks_swag, :xpath => '//*[@id="send-a-treat"]/div[3]/div[2]/div[3]/div/label/div[1]/div[1]')
    button(:create_order, :xpath => '//*[@id="root"]/div/div[2]/div/div/div/div/div[2]/div/div/div/div[2]/div/button')

    div(:build_own, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div/div[3]/div[1]/div/label/div[1]')
    link(:move_to_next, :class => 'button-program-green')
    button(:save_and_cont, :class => 'button-program-green')
    div(:dollar_45, :xpath => '//*[@id="budget-section"]/div[3]/div[1]/div/div/label/div/div[1]')
    div(:restrict_to_email, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div/div[1]/div/div/label/div')
    text_field(:total_recipients, :xpath => '//*[@id="expectedCount"]')
    text_field(:recipients_outside_us, :xpath => '//*[@id="internationalCount"]')
    div(:collect_address, :xpath => '//*[@id="recipient-information-modal-form"]/div/div/div[1]/div/div/label/div')
    div(:standard_shipping, :xpath => '//*[@id="shipping-modal-form"]/div/div[1]/div/div/label/div/div[1]')
    text_field(:msg_from, :xpath => '//*[@id="senderName"]')
    text_area(:msg, :name => 'rlpMessage')
    image(:no_customization, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div/div[9]/div/label/div/div[1]/div/img')
    div(:no_brand, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div[2]/div[2]/div/label/div')
    div(:no_video, :xpath => '//*[@id="rlp-video-modal-form"]/div[3]/div[2]/div[2]/div/label/div')
    div(:no_swag, :xpath => '//*[@id="budget-section"]/div[2]/div/div[2]/div[2]/div/div/label/div')
    image(:snackmagic_box, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div[1]/div/label/div/div[1]/img')
    div(:not_customize_box, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div/div[2]/div[2]/div/div/label/div/div')
    div(:no_note, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div/div[3]/div[2]/div[3]/div/div/label/div')
    div(:no_donation, :xpath => '//*[@id="donation-modal-form"]/div/div/div[1]/div/div[2]/div/div[3]/div[2]/div[2]/div/div/label/div')

    button(:checkout, :xpath => '//*[@id="root"]/div/div[2]/div/div/div[2]/div[2]/div/div[2]/div/div/div/div[2]/button')
    div(:avvv_card, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[1]/div/div[1]/div[2]/div/div[5]/div/label/div')

    div(:original_payment_method, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[1]/div/div[1]/div[2]/div[3]/div[2]/label/div')

    text_field(:email_from, :name => 'treatSenderName')
    text_area(:email_msg, :name => 'inviteMessage')
    div(:email_immediately, :xpath => '//*[@id="modal-root"]/div/div/div/div[1]/div/div[2]/div[3]/div/div[2]/div/div[3]/div/div/div[1]/div/label/div')

    div(:success_msg, :xpath =>'//*[@id="snack-magic-order-confirmation"]/div[1]/div/div[1]')

    def start_order
        start_new_order
    end

    def customize_snacks_and_swag
        build_their_own
        sleep 1
        click_next
        click_dollar_45
        sleep 1
        click_next
        click_restrict_to_email
        sleep 1
        click_next
        fill_recipients
        sleep 1
        click_next
        sleep 1
        click_next
        click_collect_address
        sleep 1
        click_save_and_cont
        sleep 1
        click_next
        click_standard_shipping
        sleep 1
        click_save_and_cont
        send_msg
        sleep 1
        click_next
        sleep 1
        click_next
        donot_brand
        sleep 1
        click_next
        donot_add_video
        sleep 1
        click_save_and_cont
        donot_add_swag
        sleep 1
        click_next
        click_snackmagic_box
        sleep 1
        click_next
        donot_customize_box
        sleep 1
        click_next
        donot_add_note
        sleep 1
        click_next
        donot_add_donation
        sleep 1
        click_save_and_cont
        sleep 1
    end

    def fill_treat
        treat_data = data_for :treat1
        populate_page_with treat_data

        case treat_data['for']
        when /Team/i
            team_element.click
        when /Clients/i
            clients_element.click
        when /Virtual Event/i
            virtual_event_element.click
        when /Friends or Family/i
            friends_family_element.click
        when /other/i
            other_element.click
            enter_other = treat_data['other']
        end

        case treat_data['treat_type']
        when /snacks only/i
            snacks_element.click
        when /swag only/i
            swag_element.click
        when /snacks and swag/i
            snacks_swag_element.click
        end
    end

    def click_create_order
        create_order
    end

    def click_next
        move_to_next
    end

    def click_save_and_cont
        save_and_cont
    end

    def proceed_to_checkout
        checkout
    end

    def click_saved_credit_card
        avvv_card_element.click
    end

    def click_original_payment_method
        original_payment_method_element.click
    end

    def send_email
        populate_page_with data_for :email
        email_immediately_element.click
    end

    def success_msg_text
        success_msg_element.text
    end

    private

    def build_their_own
        build_own_element.click
    end

    def click_dollar_45
        dollar_45_element.click
    end

    def click_restrict_to_email
        restrict_to_email_element.click
    end

    def fill_recipients
        populate_page_with data_for :recipients
    end

    def click_collect_address
        collect_address_element.click
    end

    def click_standard_shipping
        standard_shipping_element.click
    end

    def send_msg
        populate_page_with data_for :message
    end

    def click_no_customization
        no_customization_element.click
    end

    def donot_brand
        no_brand_element.click
    end

    def donot_add_video
        no_video_element.click
    end

    def donot_add_swag
        no_swag_element.click
    end

    def click_snackmagic_box
        snackmagic_box_element.click
    end

    def donot_customize_box
        not_customize_box_element.click
    end

    def donot_add_note
        no_note_element.click
    end

    def donot_add_donation
        no_donation_element.click
    end
end