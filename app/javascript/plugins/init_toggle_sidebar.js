const initToogleSidebar = () => {
  const home = document.querySelector("#home li");
  const project = document.getElementById("project");
  const property = document.querySelector("#property li");

  // jQuery(function () {
  //     var pathname = document.location.pathname;
  //     console.log('the pathname is: ', pathname);

  //     jQuery('#nav li').each(function () {
  //         var value = jQuery(this).attr('href');
  //         if (pathname.indexOf(value) > -1) {
  //             jQuery(this).addClass("active").siblings().removeClass("active");
  //             return false;
  //         }
  //     })
  // });

  // var url = window.location.pathname;
  //   $('ul.navbar-nav a[href="' + url + '"]').parent().addClass('active');
  // });

//   if (home) {
//   project.addEventListener( "click", () => {
//     $(home).addClass("active").siblings().removeClass("active");
//    });
//   home.addEventListener("click", () => {
//     $(home).addClass("active").siblings().removeClass("active");
//     console.log("hi");
//   });
//   property.addEventListener("click", () => {
//     $(property).addClass("active").siblings().removeClass("active");
//   });
// };

// $(document).ready(function(){
//    $(".active").removeClass("active");
//    $("project").addClass("active");
// });
}

export { initToogleSidebar };
