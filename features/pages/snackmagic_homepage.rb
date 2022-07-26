class SnackMagicHomePage
    include PageObject

    link(:start_order, :xpath => '//*[@id="root"]/div/div[2]/div/div/div/div/div[3]/header/div[2]/div[3]/div[1]/div/a[2]')
    button(:done, :xpath => '//*[@id="onetrust-accept-btn-handler"]')

    def click_start_order
        start_order_element.click
    end

    def click_done
        done
    end
end