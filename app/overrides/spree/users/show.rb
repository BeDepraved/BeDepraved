Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "user_info",
  :insert_after => "[data-hook='account_summary'] #user-info dd:first"
  ) do
    <<-CODE.chomp
    
    <!-- Facebook Script for the share button -->
    <div id="fb-root"></div>
      <script>
      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=702517669822721";
          fjs.parentNode.insertBefore(js, fjs);
          }(document, 'script', 'facebook-jssdk'));
        </script>
    
    <dt>Referral URL</dt>
      <dd><input type='text' value='<%= referral_url(@user.referral.code) %>' onClick='this.select();' /></dd>
          
        <!-- Facebook Share Button -->
      <div class="fb-share-button" data-href="<%= referral_url(@user.referral.code) %>" data-layout="button"></div>
      
      <!-- Twitter Share Button -->
      <a href="https://twitter.com/share" class="twitter-share-button" data-url="<%= referral_url(@user.referral.code) %>" data-text="A game pushing humanity. Highlight the deepest darkest corners of your friends minds!" data-count="none">Tweet</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>  
        
      <!-- Switched from user count to sales count -->
      <dt>Referred Sales</dt>
      <dd><%= @user.referral.referred_orders.count %></dd>
    CODE
  end