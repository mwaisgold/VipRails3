module ApplicationHelper
  def balls_image_link(catalogue_product)
    number = (catalogue_product.average_score * 10).to_i.to_s.sub(/\.0$/, "")
    capture_haml do
      haml_tag(:img, src: "http://img.mlstatic.com/org-img/reviews/#{number}BALLSON.gif", align: "absbottom")
    end
  end
end
