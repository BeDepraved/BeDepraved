Deface::Override.new(
  :virtual_path => "spree/shared/_head",
  :name => "BS4-CSS",
  :insert_before => "erb[loud]:contains('stylesheet_link_tag')"
  ) do
    <<-CODE.chomp
<link rel="stylesheet" href="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css">

    CODE
  end

Deface::Override.new(
  :virtual_path => "spree/shared/_head",
  :name => "BS4-JS",
  :insert_after => "erb[loud]:contains('javascript_include_tag')"
  ) do
    <<-CODE.chomp
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script>

    CODE
  end