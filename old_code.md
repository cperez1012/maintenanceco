  <head>
    <title>Maintenaceco</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  Gemlock file

  omniauth-rails_csrf_protection (0.1.2)  #Line 123
  omniauth-rails_csrf_protection #Line 223


  #Edit Task
  <%= form_for :task, url: task_path(@task), method: :patch do |f| %>
  <% if @task.errors.any? %>
  <div id="error_explanation">
    <h2><%= pluralize(@task.errors.count, "error") %> prohibited
      this task from being saved:</h2>
    <ul>
    <% @task.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
    </ul>
  </div>
  <% end %>

  <%= f.label :project%><br>
  <%= f.text_field :project%><br>
 
  <br><%= f.label :priority%><br>
  <%= f.select :priority, [['Low'], ['Medium'], ['High']]%><br>

  <br><%= f.label :status%><br>
  <%= f.select :status, [['Pending'], ['Completed']]%><br>

  <br><%= f.label :name%><br>
  <%= f.text_field :name%><br>

  <br><%= f.label :summary%><br>
  <%= f.text_field :summary%><br>
  
  <br><%= f.label :description%><br>
  <%= f.text_area :description%><br>
  <p>
    <%= f.submit %>
  </p>
<% end %>