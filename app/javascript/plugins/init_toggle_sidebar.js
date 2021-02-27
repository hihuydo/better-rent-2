const initToogleSidebar = () => {
  const home = document.querySelector("#home li");
  const project = document.getElementById("project");
  const property = document.querySelector("#property li");

  console.log(project);

  // var url = window.location.pathname;
  //   $('ul.navbar-nav a[href="' + url + '"]').parent().addClass('active');
  // });

  if (home) {
  project.addEventListener( "click", () => {
    $(home).addClass("active").siblings().removeClass("active");
   });
  home.addEventListener("click", () => {
    $(home).addClass("active").siblings().removeClass("active");
    console.log("hi");
  });
  property.addEventListener("click", () => {
    $(property).addClass("active").siblings().removeClass("active");
  });
};

// $(document).ready(function(){
//    $(".active").removeClass("active");
//    $("project").addClass("active");
// });
}

export { initToogleSidebar };
