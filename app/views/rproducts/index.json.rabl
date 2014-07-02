collection @rproducts, :object_root=>false

attributes :id, :name
node :uri do |rproduct|
    rproduct_url :id => rproduct.id
end