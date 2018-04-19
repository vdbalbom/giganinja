// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// another way to solve (try later)
//https://rbudiharso.wordpress.com/2010/07/07/dynamically-add-and-remove-input-field-in-rails-without-javascript/
function addTelefoneField() {
  let div = document.createElement("div")
  div.innerHTML = "<input type=\"text\" placeholder=\"DDD\" name=\"ddds[]\">\n" +
                  "<input type=\"text\" placeholder=\"Telefone\" name=\"telefones[]\">\n" +
                  "<input type=\"text\" placeholder=\"Referência\" name=\"t_referencias[]\">"
  document.getElementById("telefones_field").appendChild(div);
}
