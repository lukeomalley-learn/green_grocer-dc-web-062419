def consolidate_cart(cart)
  cart_hash = {}
  cart.each do |item_hash|
    item_hash.each do |item, properties|
      if !cart_hash.has_key?(item)
        cart_hash[item] = {:count => 1}
        cart_hash[item] = cart_hash[item].merge(properties)
      else
        cart_hash.has_key?(item)
        cart_hash[item][:count] += 1
      end
    end
  end
  return cart_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon_hash|
<<<<<<< HEAD
    if cart.has_key?(coupon_hash[:item]) && cart[coupon_hash[:item]][:count] >= coupon_hash[:num]
      if cart.has_key?("#{coupon_hash[:item]} W/COUPON") && cart[coupon_hash[:item]][:count] >= coupon_hash[:num]
        cart["#{coupon_hash[:item]} W/COUPON"][:count] += 1
        cart[coupon_hash[:item]][:count] -= coupon_hash[:num]
      else
        cart["#{coupon_hash[:item]} W/COUPON"] = {:price => coupon_hash[:cost], :clearance => cart[coupon_hash[:item]][:clearance], :count => 1}
        cart[coupon_hash[:item]][:count] -= coupon_hash[:num]
      end
    end
    
=======
    if cart.has_key?(coupon_hash[:item])
      cart["#{coupon_hash[:item]} W/COUPON"] = {:price => coupon_hash[:cost], :clearance => cart[coupon_hash[:item]][:clearance], :count => 1}
    end
>>>>>>> 0124d4775a237055319148b1768d2db5456baf5f
  end
  return cart
end

def apply_clearance(cart)
  cart.each do |item, data|
    if data[:clearance]
      data[:price] *= 0.8
      data[:price] = data[:price].round(3)
    end
  end
end

def checkout(cart, coupons)
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  
  total = 0
  cart.each do |item, data|
    total += data[:price]*data[:count]
  end
  if total > 100
    total *= 0.9
  end
  return total
end


cart = [
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
<<<<<<< HEAD
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }},
  {"AVOCADO" => {:price => 3.0, :clearance => true }}
]

coupons = [
      {:item => "AVOCADO", :num => 2, :cost => 5.00},
      {:item => "AVOCADO", :num => 2, :cost => 5.00}
    ]
=======
  {"KALE"    => {:price => 3.0, :clearance => false}}
]
cart = consolidate_cart(cart)
coupons = [
      {:item => "AVOCADO", :num => 2, :cost => 5.00},
      {:item => "BEER", :num => 2, :cost => 20.00},
      {:item => "CHEESE", :num => 3, :cost => 15.00}
    ]
    
puts apply_coupons(cart, coupons)
>>>>>>> 0124d4775a237055319148b1768d2db5456baf5f
