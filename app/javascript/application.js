// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "../custom/update_success";

$(function () {
    "use strict";
    $("#main-wrapper").AdminSettings({
      Layout: "vertical", // vertical | horizontal
      SidebarType: "mini-sidebar", // full / mini-sidebar
      BoxedLayout: true, // true | false
      Direction: "ltr", // ltr | rtl
      Theme: "light", // light | dark
      ColorTheme: "Red_Theme", // Red_Theme | Aqua_Theme | Purple_Theme | Green_Theme | Cyan_Theme | Orange_Theme
      cardBorder: false // true | false
    });
  });
  
  
  