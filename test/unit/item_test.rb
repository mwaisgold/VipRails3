require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  setup do
    @site = Site.create site_id: "MLA", locale: "es"
  end

  test "No me deberia dejar instertar un item sin titulo" do
    item = Item.new price: 100, description: "description", image: "image.jpg", bids_count: 35, site_id: @site.id
    assert !item.valid?
    assert !item.errors[:title].blank?
  end

  test "No me deberia dejar instertar un item sin precio" do
    item = Item.new title: "titulo", description: "description", image: "image.jpg", bids_count: 35, site_id: @site.id
    assert !item.valid?
    assert !item.errors[:price].blank?
  end

  test "No me deberia dejar instertar un item sin site_id" do
    item = Item.new price: 100, description: "description", image: "image.jpg", bids_count: 35, title: "titulo"
    assert !item.valid?
    assert !item.errors[:site_id].blank?
  end

  test "No me deberia dejar instertar un item sin bids_count" do
    item = Item.new price: 100, description: "description", image: "image.jpg", title: "titulo", site_id: @site.id
    assert !item.valid?
    assert !item.errors[:bids_count].blank?
  end

  test "No me deberia dejar instertar un item con un site que no exista" do
    item = Item.new price: 100, description: "description", image: "image.jpg", bids_count: 35, title: "titulo", site_id: "MLPEPE"
    assert !item.valid?
    assert !item.errors[:site_id].blank?
  end

  test "No me deberia dejar instertar un item con un precio no numerico" do
    item = Item.new price: "as100", description: "description", image: "image.jpg", bids_count: 35, title: "titulo", site_id: @site.id
    assert !item.valid?
    assert !item.errors[:price].blank?
  end

  test "No me deberia dejar instertar un item con un bids count no numerico" do
    item = Item.new price: 100, description: "description", image: "image.jpg", bids_count: "as35", title: "titulo", site_id: @site.id
    assert !item.valid?
    assert !item.errors[:bids_count].blank?
  end

  test "No me deberia dejar instertar un item con un bids count decimal" do
    item = Item.new price: 100, description: "description", image: "image.jpg", bids_count: 35.82734987, title: "titulo", site_id: @site.id
    assert !item.valid?
    assert !item.errors[:bids_count].blank?
  end

  test "Deberia instertar un item correctamente" do
    item = Item.new price: 100, description: "description", image: "image.jpg", bids_count: 35, title: "titulo", site_id: @site.id
    assert item.save
  end

  teardown do
    Site.delete :all
  end
end
