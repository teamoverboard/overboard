//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require rainbow
//= require pgwmodal
//= require autocomplete-rails
//= require_tree .

$( document ).ready(function() {
  Rainbow.color();

  $('.sign_in').click(function() {
    $.pgwModal({target: '#sign_in_model', maxWidth: 325, closeContent: '', titleBar: false});
  });
});
