atom_feed do |feed|
  feed.title "Хто замовив #{@product.title}"

  feed.updated @latest_order.try(:updated_at) 

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Замовлення: #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Зателефонувати #{order.phone}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Продукт'
            xhtml.th 'Кількість'
            xhtml.th 'Сума'
          end
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              xhtml.td item.total_price
            end
          end
          xhtml.tr do
            xhtml.th 'Всього:', colspan: 2
            xhtml.th order.line_items.map(&:total_price).sum
          end
        end
        xhtml.p "Оплата: #{order.pay_type}"
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end
