Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "user_info",
  :insert_after => "[data-hook='account_summary'] #user-info dd:first"
  ) do
    <<-CODE.chomp
    <dt>Spread The Depravity</dt>
      <dd>Refer your friends and earn free shit!</dd>
      
    <dt>Referral URL</dt>
      <dd><input type='text' value='<%= referral_url(@user.referral.code) %>' onClick='this.select();' /></dd>

      <dd>
      <!-- Start Social-Like Buttons -->
      <div class="social-likes" data-url="<%= referral_url(@user.referral.code) %>" data-title="Party game pushing humanity. Highlighting the deepest darkest corners of minds!">
        <div class="facebook" title="Share link on Facebook">Facebook</div>
        <div class="twitter" data-via="BeDepraved" title="Share link on Twitter">Twitter</div>
        <div class="plusone" title="Share link on Google+">Google+</div>
      </div>
      <!-- End Social-Like Buttons -->
      </dd>

      <!-- Switched from user count to sales count -->
      <dt>Referred Sales</dt>
      <dd><%= @user.referral.referred_orders.count %></dd>
    CODE
  end