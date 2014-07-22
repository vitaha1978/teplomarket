class OrderNotifier < ActionMailer::Base
  default from: "TeploMarket <shop.rivne@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Підтвердження замовлення в ТеплоМаркет'
  end

  # Підтвердження на мою почту про замовлення
  
  def notification(order)
    @order = order

    mail to: "vitaliy.parshyn@gmail.com", subject: 'Замовлення з сату ТеплоМаркет'
  end
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subjec 
  
  
  def shipped
    @order = order
    
    mail to: order.email, subject: 'Замовлення від ТеплоМаркет відправлено'
  end
end
