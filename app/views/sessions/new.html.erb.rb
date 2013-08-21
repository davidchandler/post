<%= render 'shared/content_title', title: 'Log in' %>

<div class='well'>
  <%= form_tag '/login' do %>
    <div class='control-group'>
      <%= label_tag :username %>
      <%= text_field_tag :username, params[:username] || '' %>
    </div>
    <div class='control-group'>
      <%= label_tag :password %>
      <%= password_field_tag :password, params[:password] || '' %>
    </div>
    <%= submit_tag "Login", class: 'btn btn-success' %>
  <% end %>
</div>
