# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<h1> reviews </h1>
<% if @product.reviews.any? %>
  <% @product.reviews.each do |review| %>
    <ul>
      <li>
        <li><%= link_to review.content_body, edit_product_review_path(review) %></li>
        <p>author: <%= review.author %></p>
        <p>rating : <%= review.rating %></h3>
      </li>
    </ul>
  <% end %>
<% else %>
  <p>there are no reviews for this item</p>
<% end %>
<%= button_to "Add a review for this product", 
              new_product_review_path(@product),
              method: :get %>


<%= button_to "Return to products Page", 
              products_path,
              method: :get