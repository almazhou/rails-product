collection @pricings, :object_root=>false

attributes :id, :amount, :rproduct_id

node :uri do |pricing|
    rproduct_pricing_url :rproduct_id => pricing.rproduct_id,
    :id => pricing.id
end
